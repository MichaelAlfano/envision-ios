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
    @State private var pickerSource: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    header
                    profileItem(title: Strings.Profile.WhoIAm.TITLE, content: $stateProfile.whoIAm, subtitle: Strings.Profile.WhoIAm.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.WhoIAm.TITLE)
                    profileItem(title: Strings.Profile.WhyStem.TITLE, content: $stateProfile.whySTEM, subtitle: Strings.Profile.WhyStem.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.WhyStem.TITLE)
                    profileItem(title: Strings.Profile.UsingStem.TITLE, content: $stateProfile.usingSTEM, subtitle: Strings.Profile.UsingStem.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.UsingStem.TITLE)
                    profileItem(title: Strings.Profile.AdviceForStudents.TITLE, content: $stateProfile.adviceForStudents, subtitle: Strings.Profile.AdviceForStudents.PLACEHOLDER, proxy: proxy)
                        .id(Strings.Profile.AdviceForStudents.TITLE)
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
            .onDisappear {
                defaultsManager.updateProfile(stateProfile)
                profile = stateProfile
            }
        }
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
                    (stateProfile.photo ?? Image(Assets.Images.onboarding2))
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
        Image(Assets.Icons.edit)
            .resizable()
            .frame(width: 16, height: 16)
            .scaledToFit()
    }
}
