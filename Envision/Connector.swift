//
//  Connector.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct Connector {
    let defaultsManager: DefaultsManager
    func makeRootView() -> AnyView {
        if let launchCount = defaultsManager.getInt(DefaultKeys.launchCount) {
            if launchCount > 0 {
                defaultsManager.setInt(DefaultKeys.launchCount, launchCount+1)
                return AnyView(makeHomeView())
            }
        }
        defaultsManager.setInt(DefaultKeys.launchCount, 1)
        return AnyView(makeOnboardingView())
    }
    
    func makeHomeView() -> some View {
        return Home()
    }
    
    func makeOnboardingView() -> some View {
        return Onboarding1()
    }
}
