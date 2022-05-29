//
//  SetupProfileInfo.swift
//  Envision Physics
//
//  Created by Michael Arthur Alfano on 5/24/22.
//

import SwiftUI

struct SetupProfileInfo: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var lineSpacing = 8.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Capsule()
                        .frame(width: 47, height: 6)
                        .foregroundColor(Colors.capsuleColor)
                        .padding(.bottom, 59)
                        .padding(.top, 19)
                    Spacer()
                }
                Spacer()
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text(Strings.Professionals.TITLE)
                        .styling(TextStyles.title1)
                        .lineSpacing(lineSpacing)
                    Text("Put your past on paper, envision your future, or give advice to others who are following your path.")
                        .styling(TextStyles.footnote2)
                        .lineSpacing(lineSpacing)
                        .padding(.bottom, 25)
                    HStack {
                        Text("Our profile creator allows you to express yourself with ease.")
                            .styling(TextStyles.title3)
                            .lineSpacing(lineSpacing)
                        Spacer(minLength: 22)
                        Image(AppAssets.Images.identityCard)
                            .padding(.trailing, 12)
                    }
                    Text("Simply enter your information, add a photo, and we’ll handle the rest. It’s that easy.")
                        .styling(TextStyles.footnote2)
                        .lineSpacing(lineSpacing)
                        .padding(.bottom, 25)
                    HStack {
                        Text("At Envision we believe that if you can see it, you can be it.")
                            .styling(TextStyles.title3)
                            .lineSpacing(lineSpacing)
                        Spacer(minLength: 22)
                        Image(AppAssets.Images.capeMan)
                            .padding(.trailing, 9)
                    }
                    Text("We are here to empower you and help you through your physics journey.")
                        .styling(TextStyles.footnote2)
                        .lineSpacing(lineSpacing)
                        .padding(.bottom, 25)
                }
                .padding(.horizontal, 30)
                .padding(.top, 84)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(
                        action: { presentationMode.wrappedValue.dismiss() },
                        label: {
                            Text("GET STARTED")
                        }
                    )
                    .buttonStyle(OnboardingButton())
                    .padding(.bottom, 36)
                }
            }
        }
    }
}

struct SetupProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        SetupProfileInfo()
    }
}
