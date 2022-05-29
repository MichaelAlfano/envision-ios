//
//  Onboarding+2.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct Onboarding2: View {
    @State var connector: Connector
    
    var body: some View {
        OnboardingView(
            photo: Image(AppAssets.Images.onboarding2),
            title: Strings.Onboarding.Slide2.TITLE,
            subTitle: Strings.Onboarding.Slide2.SUB_TITLE,
            buttonText: Strings.Onboarding.Slide2.BUTTON,
            buttonDestination: AnyView(connector.makeHomeView()),
            index: 1,
            connector: connector
        )
    }
}
