//
//  CareerInterests.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

struct InterestsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var interests: Interests
    @State var stateInterests: Interests
    
    @State var currentCategory: InterestCategories = .career
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    header
                    options
                }
                .padding(.bottom, 100)
            }
            VStack {
                Spacer()
                nextButton
            }
        }
        .navigationBarItems(leading: BackButton(presentationMode: presentationMode))
        .onDisappear {
            interests = stateInterests
        }
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(currentCategory == .career ? Strings.Interests.SATISFACTION_TITLE : Strings.Interests.FIELDS_TITLE)
                    .styling(TextStyles.title1)
                Text(currentCategory == .career ? Strings.Interests.SATISFACTION_SUBTITLE : Strings.Interests.FIELDS_SUBTITLE)
                    .styling(TextStyles.footnote2)
                    .padding(.top, 21)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 18)
            Spacer()
        }
    }
    
    private var options: some View {
        ForEach((currentCategory == .career ? Interests.Career.careerOptions : Interests.Fields.fieldOptions), id: \.self) { interest in
            Button(action: {
                currentCategory == .career ? stateInterests.toggleCareer(interest) : stateInterests.toggleField(interest)
            }, label: {
                HStack {
                    Image((currentCategory == .career ? $stateInterests.career.wrappedValue.contains(interest) : $stateInterests.fields.wrappedValue.contains(interest)) ? Assets.Icons.Radio.selected : Assets.Icons.Radio.unselected)
                        .resizable()
                        .frame(width: 20, height: 20)
                    HStack(alignment: .center) {
                        Spacer()
                        Text(interest)
                            .foregroundColor((currentCategory == .career ? $stateInterests.career.wrappedValue.contains(interest) : $stateInterests.fields.wrappedValue.contains(interest)) ? Colors.darkBackgroundText : Color.black)
                            .font(Fonts.title3)
                        Spacer()
                    }
                }
                .padding(15)
                .background((currentCategory == .career ? $stateInterests.career.wrappedValue.contains(interest) : $stateInterests.fields.wrappedValue.contains(interest)) ? Colors.primary : Color.white)
                .cornerRadius(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke((currentCategory == .career ? $stateInterests.career.wrappedValue.contains(interest) : $stateInterests.fields.wrappedValue.contains(interest)) ? Color.clear : Colors.border, lineWidth: 1)
                )
            })
            .buttonStyle(Scale())
            .padding(.horizontal, 30)
            .padding(.top, 12)
        }
    }
    
    private var nextButton: some View {
        HStack {
            if currentCategory == .field {
                Button(action: {
                    withAnimation {
                        currentCategory = .career
                    }
                }, label: {
                    Text(Strings.BACK)
                        .rotationEffect(.degrees(180))
                })
                .buttonStyle(OnboardingButton())
                .rotationEffect(.degrees(180))
            }
            Spacer()
            Button(action: {
                withAnimation {
                    switch currentCategory {
                    case .career:
                        currentCategory = .field
                    case .field:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }, label: {
                Text(currentCategory == .career ? Strings.NEXT : Strings.FINISH)
            })
            .disabled(currentCategory == .career ? ($stateInterests.career.count != 3) : ($stateInterests.fields.count != 2))
            .opacity((currentCategory == .career ? ($stateInterests.career.count != 3) : ($stateInterests.fields.count != 2)) ? 0.4 : 1.0)
            .buttonStyle(OnboardingButton())
        }
        .animation(.easeInOut)
    }
}

enum InterestCategories {
    case career
    case field
}
