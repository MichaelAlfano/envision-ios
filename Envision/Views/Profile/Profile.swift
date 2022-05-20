//
//  Profile.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var profile: ProfileData
    private var image: Image
    
    init(id: UUID) {
        self.profile = Content.profiles.first(where: { $0.id == id }) ?? ProfileData.error()
        self.image = profile.photo ?? Image(Assets.Images.onboarding2)
    }
    
    init(profile: ProfileData, photo: Image?) {
        self.profile = profile
        self.image = photo ?? Image(Assets.Images.onboarding2)
    }
    
    init(profile: ProfileData) {
        self.profile = profile
        self.image = profile.photo ?? Image(Assets.Images.onboarding2)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                header
                if !profile.whoIAm.isBlank {
                    profileItem(title: Strings.Profile.WhoIAm.TITLE, content: profile.whoIAm)
                }
                if !profile.whySTEM.isBlank {
                    profileItem(title: Strings.Profile.WhyStem.TITLE, content: profile.whySTEM)
                }
                if !profile.usingSTEM.isBlank {
                    profileItem(title: Strings.Profile.UsingStem.TITLE, content: profile.usingSTEM)
                }
                if !profile.adviceForStudents.isBlank {
                    profileItem(title: Strings.Profile.AdviceForStudents.TITLE, content: profile.adviceForStudents)
                }
            }
            .padding(.bottom, 35)
        }
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
    }
    
    var header: some View {
        VStack(spacing: 0) {
            (image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .shadow(color: Colors.dropShadow, radius: 6, x: 0, y: 3)
                .clipShape(Circle())
            Text(profile.name)
                .styling(TextStyles.header2)
                .padding(.top, 20)
                .padding(.bottom, 5)
            Text(profile.career)
                .styling(TextStyles.subtitle4)
        }
        .padding(.bottom, 35)
    }
    
    func profileItem(title: String, content: String) -> some View {
        VStack {
            Text(title)
                .styling(TextStyles.title3)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.white)
                    .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
                HStack {
                    Text(content)
                        .styling(TextStyles.subtitle3Primary)
                    Spacer()
                }
                .padding(20)
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 10)
        }
    }
}

struct ProfilePreviews: PreviewProvider {
    static var previews: some View {
        Profile(id: UUID())
    }
}
