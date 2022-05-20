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
            Text(timeEstimate)
                .styling(TextStyles.subtitle3)
            Text(title)
                .styling(TextStyles.title2)
                .padding(.top, 6)
                .padding(.bottom, 27)
        }
    }
    
    var startButton: some View {
        Text("Start")
            .frame(width: 188, height: 30, alignment: .center)
            .foregroundColor(Colors.darkBackgroundText)
            .font(Fonts.title3)
            .background(Colors.primary)
            .cornerRadius(8)
    }
}

struct ActionCellPreviews: PreviewProvider {
    static var previews: some View {
        ActionCell(
            title: "Choose Interests",
            timeEstimate: "10 mins"
        )
    }
}
