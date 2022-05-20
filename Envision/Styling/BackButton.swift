//
//  BackButton.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

struct BackButton: View {
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss() }) {
            Image(Assets.Icons.chevronBlack)
                .resizable()
                .scaledToFit()
                .frame(width: 55, height: 55)
                .rotationEffect(.degrees(180))
                .offset(x: -70, y: 0)
        }
    }
}
