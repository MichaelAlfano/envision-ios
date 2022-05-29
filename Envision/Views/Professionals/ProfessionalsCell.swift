//
//  ProfessionalsCell.swift
//  Envision STEM
//
//  Created by Michael Arthur Alfano on 5/20/22.
//

import SwiftUI

struct ProfessionalsCell: View {
    var photo: Image
    var title: String
    var subtitle: String
    var paragraph: String
    
    var body: some View {
        VStack {
            image
            content
        }
        .background(
            Color.white
                .cornerRadius(8)
                .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
        )
        .frame(height: 350)
        .padding(.horizontal, 16)
    }
    
    var image: some View {
        photo
            .resizable()
            .scaledToFill()
            .padding(-10)
            .frame(height: 161)
            .cornerRadius(8, corners: [.topRight, .topLeft])
            .ignoresSafeArea()
            .clipped()
    }
    
    var content: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .styling(TextStyles.title2)
                Text(subtitle)
                    .styling(TextStyles.subtitle2)
                    .padding(.top, 6)
                Text(paragraph)
                    .styling(TextStyles.subtitle2)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.top, 20)
            }
            .padding(17)
            .padding(.bottom, -2)
            Spacer()
        }
    }
}

struct ProfessionalsCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionalsCell(
            photo: ProfileCellData.stub().image,
            title: ProfileCellData.stub().title,
            subtitle: ProfileCellData.stub().subtitle,
            paragraph: ProfileCellData.stub().paragraph
        )
    }
}
