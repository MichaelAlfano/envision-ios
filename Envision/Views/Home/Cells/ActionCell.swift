//
//  ActionCell.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/12/22.
//

import SwiftUI

struct ActionCell: View {
    var id = UUID()
    var title: String
    var timeEstimate: String
    var isComplete: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
            startButton
        }
        .frame(width: 218, height: 133)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            if isComplete {
                Text("Complete")
                    .styling(TextStyles.title6)
                    .padding(3)
                    .padding(.horizontal, 3)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Colors.green)
                    )
                    .padding(.bottom, 4)
                    .padding(.top, 17)
            } else {
                Text(timeEstimate)
                    .styling(TextStyles.subtitle3)
                    .padding(.top, 18)
            }
            Text(title)
                .styling(TextStyles.title2)
                .padding(.top, 6)
            Spacer()
        }
    }
    
    var startButton: some View {
        Text(isComplete ? "Edit" : "Start")
            .frame(width: 188, height: 30, alignment: .center)
            .foregroundColor(Colors.darkBackgroundText)
            .font(Fonts.title3)
            .background(Colors.primary)
            .cornerRadius(8)
            .padding(.bottom, 15)
    }
}

struct ActionCellPreviews: PreviewProvider {
    static var previews: some View {
        ActionCell(
            title: "Choose Interests",
            timeEstimate: "10 mins",
            isComplete: false
        )
    }
}
