//
//  ContentView.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import SwiftUI
import SafariServices

struct Home: View {
    
    let presenter: HomePresenter
    
    @State var profile: ProfileData
    @State var interests: Interests
    
    let defaultsManager: DefaultsManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                header
                actionItems
                industryProffessionals
                resources
                credit
            }
        }
        .navigationBarHidden(true)
        .background(
            NavigationLink(destination: self.navigateTo, isActive: $isNavigationActive) {
                EmptyView()
            })
    }
    
    @State var navigateTo: AnyView?
    @State var isNavigationActive = false
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(Strings.Home.SCREEN_TITLE)
                    .styling(TextStyles.title1)
                Spacer()
                Menu(content: {
                    Button {
                        navigateTo = AnyView(InterestsView(
                                                interests: $interests,
                                                stateInterests: interests
                                            ))
                        isNavigationActive = true
                    } label: {
                        Label(Strings.Professionals.SUBTITLE_TWO, systemImage: "chevron.right")
                    }
                    Button {
                        navigateTo = AnyView(SetupProfile(
                                                profile: $profile,
                                                stateProfile: $profile.wrappedValue,
                                                defaultsManager: defaultsManager
                                            ))
                        isNavigationActive = true
                    } label: {
                        Label(Strings.Profile.PROFILE, systemImage: "chevron.right")
                    }
                }, label: {
                    Image(AppAssets.Icons.profile)
                        .resizable()
                        .frame(width: 25, height: 25)
                })
            }
                .padding(.top, 40)
            Text(interests.isComplete() && profile.isComplete() ? "All action items have been completed." : Strings.Home.SCREEN_SUBTITLE)
                .styling(TextStyles.footnote2)
                .padding(.top, 21)
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }
    
    private var actionItems: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(presenter.actionItems(profile: self.$profile, interests: self.$interests, defaultsManager: defaultsManager)) { item in
                    NavigationLink(
                        destination: item.view,
                        label: {
                            ActionCell(
                                title: item.title,
                                timeEstimate: item.timeEstimate,
                                isComplete: item.isComplete
                            )
                        }
                    )
                    .buttonStyle(Scale())
                }
                .padding(10)
            }
            .padding(.top, -10)
            .padding(20)
            .padding(.bottom, 5)
        }
    }
    
    private var industryProffessionals: some View {
        VStack(alignment: .leading, spacing: 0) {
            NavigationLink(
                destination: ProfessionalsView(
                    presenter: ProfessionalsViewPresenter(
                        profile: $profile,
                        interests: $interests
                    ),
                    professionals: presenter.industryProfesionals,
                    interests: interests
                ),
                label: {
                    HStack {
                        Text(Strings.Professionals.TITLE)
                            .styling(TextStyles.title2)
                            .padding(.leading, 30)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.black)
                            .padding(.leading, 5)
                    }
                }
            )
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(presenter.industryProfesionals) { item in
                        NavigationLink(
                            destination: Profile(id: item.id),
                            label: {
                                ProfileCell(
                                    photo: item.image,
                                    title: item.title,
                                    subtitle: item.subtitle,
                                    paragraph: item.paragraph
                                )
                        })
                        .buttonStyle(Scale())
                    }
                    .padding([.horizontal, .bottom], 10)
                }
                .padding(20)
                .padding(.vertical, 5)
            }
        }
    }
    
    func hasAnyMatching() -> Bool {
        for professional in presenter.industryProfesionals {
            if professional.interests.contains(interests) {
                return true
            }
        }
        return false
    }
    
    private var resources: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(Strings.RESOURCES_TITLE)
                .styling(TextStyles.title2)
                .padding(.leading, 30)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(presenter.resources) { item in
                        ResourceCell(
                            photo: Image(item.imageName),
                            title: item.title,
                            subtitle: item.subtitle,
                            paragraph: item.paragraph,
                            action: SFSafariHelper(url: item.url).present
                        )
                    }
                    .padding([.horizontal, .bottom], 10)
                }
                .padding(20)
                .padding(.vertical, 5)
            }
        }
    }
    
    private var credit: some View {
        VStack(alignment: .leading) {
            Text("Credit")
                .styling(TextStyles.title2)
                .padding(.bottom, 20)
            Menu(content: {
                Button(action: presenter.linkedInAction) {
                    Label(
                        title: { Text(Strings.MadeBy.LINKEDIN) },
                        icon: { Image(AppAssets.Icons.linkedin) }
                    )
                }
                Button(action: presenter.emailAction) {
                    Label(
                        title: { Text(Strings.MadeBy.EMAIL) },
                        icon: { Image(systemName: "envelope") }
                    )
                }
            }, label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Designer and developer")
                            .styling(TextStyles.subtitle5)
                            .padding(.bottom, 4)
                        Text(Strings.MadeBy.NAME)
                            .styling(TextStyles.title3Dark)
                    }
                    .padding(.vertical, 12)
                    Spacer()
                    Image(AppAssets.Icons.chevronWhite)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(90))
                        .padding(.trailing, 8)
                }
                .padding(5)
                .padding(.leading, 14)
                .padding(.trailing, 3)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Colors.primary)
                        .shadow(color: Colors.dropShadow, radius: 6, x: 0, y: 3)
                )
            })
            .padding(.bottom, 15)
            Menu(content: {
                Button(action: presenter.apsWebsiteAction) {
                    Label(
                        title: { Text("Website") },
                        icon: { Image(systemName: "safari") }
                    )
                }
            }, label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Provider of all industry professionals and the concept for profile creation.")
                            .styling(TextStyles.subtitle5)
                            .padding(.bottom, 4)
                        Text("American Physical Society (APS)")
                            .styling(TextStyles.title3Dark)
                    }
                    .padding(.vertical, 12)
                    Spacer()
                    Image(AppAssets.Icons.chevronWhite)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(90))
                        .padding(.trailing, 8)
                }
                .padding(5)
                .padding(.leading, 14)
                .padding(.trailing, 3)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Colors.primary)
                        .shadow(color: Colors.dropShadow, radius: 6, x: 0, y: 3)
                )
            })
        }
        .padding([.horizontal, .bottom], 30)
        .padding(.bottom, 80)
    }
}
