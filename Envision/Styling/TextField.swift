//
//  TextField.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/17/22.
//

import SwiftUI

struct EditNameTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("Name")
                    .styling(TextStyles.title4)
                    .padding(3)
            }
            configuration
                .font(Fonts.header2)
                .foregroundColor(Colors.primaryText)
                .padding(8)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Colors.textFieldBorder, lineWidth: 2)
                )
        }
    }
}

struct EditCareerTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text("Career")
                    .styling(TextStyles.title4)
                    .padding(3)
                    .padding(.top, 5)
            }
            configuration
                .font(Fonts.subtitle4)
                .foregroundColor(Colors.secondaryText)
                .padding(6)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Colors.textFieldBorder, lineWidth: 2)
                )
        }
    }
}
