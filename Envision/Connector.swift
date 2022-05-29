//
//  Connector.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct Connector {
    
    let defaultsManager: DefaultsManager
    @ObservedObject var userData: UserData
    
    func makeRootView() -> AnyView {
        let launchCount = defaultsManager.getInt(DefaultKeys.launchCount)
        if launchCount > 0 {
            defaultsManager.setInt(DefaultKeys.launchCount, launchCount+1)
            return AnyView(makeHomeView())
        }
        defaultsManager.setInt(DefaultKeys.launchCount, 1)
        return AnyView(makeOnboardingView())
    }
    
    func makeHomeView() -> some View {
        return Home(
            presenter: HomePresenter(
                profile: $userData.profile,
                interests: $userData.interests
            ),
            profile: userData.profile,
            interests: userData.interests,
            defaultsManager: defaultsManager
        )
    }
    
    func makeOnboardingView() -> some View {
        return Onboarding1(connector: self)
    }
}


public class UserData: ObservableObject {
    @Published public var profile: ProfileData = DefaultsManager().getProfile()
    @Published public var interests: Interests = DefaultsManager().getInterests()
}
