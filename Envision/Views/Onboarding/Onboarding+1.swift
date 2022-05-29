//
//  Onboarding+1.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct Onboarding1: View {
    @State var connector: Connector
    
    var body: some View {
        OnboardingView(
            photo: Image(AppAssets.Images.onboarding1),
            title: Strings.Onboarding.Slide1.TITLE,
            subTitle: Strings.Onboarding.Slide1.SUB_TITLE,
            buttonText: Strings.Onboarding.Slide1.BUTTON,
            buttonDestination: AnyView(Onboarding2(connector: connector)),
            index: 0,
            connector: connector
        )
    }
}
