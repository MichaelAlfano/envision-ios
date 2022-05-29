//
//  OnboardingView.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

struct OnboardingView: View {
    @State var photo: Image
    @State var title: String
    @State var subTitle: String
    @State var buttonText: String
    @State var buttonDestination: AnyView?
    @State var index: Int
    @State var connector: Connector
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    image(geometry)
                    Spacer()
                }
                VStack {
                    Spacer()
                    content
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    private func image(_ geometry: GeometryProxy) -> some View {
        return photo
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .frame(width: geometry.size.width, height: geometry.size.width+75, alignment: .center)
            .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    private var content: some View {
        VStack(spacing: 0) {
            header
            progress
            subtitle
            button
        }
        .background(background)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color.white)
            .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: -3)
            .edgesIgnoringSafeArea(.all)
    }
    
    private var header: some View {
        Text(title)
            .styling(TextStyles.header1)
            .lineSpacing(5)
            .multilineTextAlignment(.center)
            .padding(.top, 40)
    }
    
    private var progress: some View {
        HStack {
            ForEach(0..<2, content: { index in
                Circle()
                    .foregroundColor(index == self.index ? Colors.primary : Colors.secondary)
                    .frame(width: 8, height: 8, alignment: .center)
            })
        }
        .padding(20)
    }
    
    private var subtitle: some View {
        Text(subTitle)
            .styling(TextStyles.onboardingSubtitle)
            .lineSpacing(5)
            .multilineTextAlignment(.center)
            .padding(.bottom, 30)
            .padding(.horizontal, 24)
    }
    
    private var button: some View {
        HStack {
            Spacer()
            NavigationLink(destination: buttonDestination, label: {
                Text(buttonText)
            })
            .buttonStyle(OnboardingButton())
        }
        .padding(.bottom, 12)
    }
}
