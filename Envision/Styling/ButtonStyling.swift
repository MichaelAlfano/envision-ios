//
//  Buttons.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct OnboardingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Onboarding Button", action: {})
                .buttonStyle(OnboardingButton())
        }
    }
}
