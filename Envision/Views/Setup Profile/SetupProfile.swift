//
//  SetupProfile.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

struct SetupProfile: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var profile: ProfileData
    @State var stateProfile: ProfileData
    let defaultsManager: DefaultsManager
    
    @State private var showImagePicker: Bool = false
    @State private var showIntroSheet: Bool = false
    @State private var pickerSource: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    header
                    profileItem(title: Strings.Profile.WhoIAm.TITLE, content: $stateProfile.whoIAm, subtitle: Strings.Profile.WhoIAm.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.WhoIAm.TITLE)
                    profileItem(title: Strings.Profile.WhyPhysics.TITLE, content: $stateProfile.whyPhysics, subtitle: Strings.Profile.WhyPhysics.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.WhyPhysics.TITLE)
                    profileItem(title: Strings.Profile.UsingPhysics.TITLE, content: $stateProfile.usingPhysics, subtitle: Strings.Profile.UsingPhysics.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.UsingPhysics.TITLE)
                    profileItem(title: Strings.Profile.AdviceForStudents.TITLE, content: $stateProfile.adviceForStudents, subtitle: Strings.Profile.AdviceForStudents.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.AdviceForStudents.TITLE)
                    moreInformationButton
                }
                .padding(.bottom, 30)
            }
            .onTapGesture(perform: UIApplication.shared.endEditing)
            .navigationBarItems(
                leading: BackButton(presentationMode: presentationMode),
                trailing: Button(
                    action: {
                        PDF.exportToPDF(profile: stateProfile, image: stateProfile.photo)
                    },
                    label: {
                        Text(Strings.EXPORT)
                            .styling(TextStyles.title3)
                    })
            )
            .onChange(of: stateProfile, perform: { newValue in
                defaultsManager.updateProfile(newValue)
                if let newPhoto = newValue.photo {
                    defaultsManager.updateProfilePhoto(newPhoto)
                }
            })
            .sheet(isPresented: self.$showImagePicker) {
                PhotoCaptureView(
                    showImagePicker: self.$showImagePicker,
                    image: $stateProfile.photo,
                    picker: self.$pickerSource,
                    completion: { updatedImage in
                        defaultsManager.updateProfilePhoto(updatedImage)
                    }
                )
            }
            .sheet(isPresented: $showIntroSheet) {
                SetupProfileInfo()
            }
            .onAppear {
                let setupOpenCount = defaultsManager.getInt(.profileSetup)
                if setupOpenCount > 0 {
                    defaultsManager.setInt(.profileSetup, setupOpenCount+1)
                } else {
                    defaultsManager.setInt(.profileSetup, 1)
                    showIntroSheet = true
                }
            }
            .onDisappear {
                defaultsManager.updateProfile(stateProfile)
                profile = stateProfile
            }
        }
    }
    
    private var moreInformationButton: some View {
        Button(action: {
            showIntroSheet = true
        }, label: {
            HStack {
                Text("More Information")
                    .styling(TextStyles.title3Dark)
                Image(AppAssets.Icons.chevronWhite)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .rotationEffect(.degrees(-90))
            }
            .padding(5)
            .padding(.leading, 14)
            .padding(.trailing, 3)
            .background(Colors.primary)
            .cornerRadius(8)
        })
        .padding(.top, 40)
    }
    
    var header: some View {
        VStack(spacing: 0) {
            Menu(content: {
                Button(action: {
                    self.pickerSource = .camera
                    self.showImagePicker = true
                }) {
                    Label(Strings.TAKE_PHOTO, systemImage: "camera")
                }
                Button(action: {
                    self.pickerSource = .photoLibrary
                    self.showImagePicker = true
                }) {
                    Label(Strings.CHOOSE_PHOTO, systemImage: "photo.on.rectangle")
                }
            }, label: {
                ZStack {
                    (stateProfile.photo ?? Image(AppAssets.Images.onboarding2))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .shadow(color: Colors.dropShadow, radius: 6, x: 0, y: 3)
                        .overlay(
                            VStack {
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.black.opacity(0.6))
                                        .frame(width: 90, height: 26, alignment: .bottom)
                                    Text(Strings.EDIT)
                                        .styling(TextStyles.subtitle5)
                                }
                            }
                        )
                        .clipShape(Circle())
                }
            })
            HStack(alignment: .center) {
                Spacer()
                TextField(Strings.Profile.NAME, text: $stateProfile.name)
                    .textFieldStyle(EditNameTextFieldStyle())
                    .fixedSize()
                Spacer()
            }
                .padding(.top, 20)
                .padding(.bottom, 5)
            HStack(alignment: .center) {
                TextField(Strings.Profile.CAREER, text: $stateProfile.career)
                    .textFieldStyle(EditCareerTextFieldStyle())
                    .fixedSize()
            }
        }
        .padding(.bottom, 35)
    }
    
    func profileItem(title: String, content: Binding<String>, subtitle: String, proxy: ScrollViewProxy) -> some View {
        VStack(spacing: 0) {
            Text(title)
                .styling(TextStyles.title3)
                .underline()
            Text(subtitle)
                .styling(TextStyles.subtitle3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 10)
                .padding(.bottom, 20)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
                HStack {
                    MultilineTextField(Strings.Profile.PLACEHOLDER_ITEM, text: content)
                        .onTapGesture {
                            withAnimation {
                                proxy.scrollTo(title, anchor: .center)
                            }
                        }
                    Spacer()
                }
                .padding(20)
                HStack {
                    Spacer()
                    VStack {
                        editButton
                            .padding(13)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 25)
        }
        .padding(.bottom, 50)
    }
    
    private var editButton: some View {
        Image(AppAssets.Icons.edit)
            .resizable()
            .frame(width: 16, height: 16)
            .scaledToFit()
    }
}
