//
//  Buttons.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct ActionItemButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 188, height: 30, alignment: .center)
            .foregroundColor(Colors.darkBackgroundText)
            .font(Fonts.title3)
            .background(Colors.primary)
            .cornerRadius(8)
    }
}

struct OnboardingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(Colors.darkBackgroundText)
                .font(Fonts.title3)
            Image(AppAssets.Icons.next)
        }
        .padding(16)
        .padding(.horizontal, 8)
        .background(Colors.primary.opacity(configuration.isPressed ? 0.6 : 1.0))
        .cornerRadius(30, corners: [.topLeft, .bottomLeft])
    }
}

//struct InterestButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            Image(selected ? Assets.Icons.Radio.selected : Assets.Icons.Radio.unselected)
//                .resizable()
//                .frame(width: 20, height: 20)
//            HStack(alignment: .center) {
//                Spacer()
//                configuration.label
//                    .font(Fonts.title3)
//                Spacer()
//            }
//        }
//        .scaleEffect(configuration.isPressed ? 0.95 : 1)
//        .animation(.easeInOut(duration: 0.1))
//        .padding(.horizontal, 30)
//        .padding(.top, 12)
//    }
//}

struct Scale: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.1))
    }
}

struct ButtonsPreviews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Start", action: {})
                .buttonStyle(ActionItemButton())
        }
    }
}
