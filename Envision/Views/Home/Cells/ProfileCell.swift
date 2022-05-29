//
//  ProfileCell.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

struct ProfileCell: View {
    var photo: Image
    var title: String
    var subtitle: String
    var paragraph: String
    
    var body: some View {
        VStack {
            image
            content
        }
        .frame(width: 268, height: 320)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Colors.dropShadow, radius: 12, x: 0, y: 3)
    }
    
    var image: some View {
        photo
            .resizable()
            .scaledToFill()
            .padding(-10)
            .frame(width: 258, height: 143)
            .ignoresSafeArea()
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

struct ProfileCellPreviews: PreviewProvider {
    static var previews: some View {
        ProfileCell(
            photo: Image(AppAssets.Images.testProffesional),
            title: "Kieran Hissa",
            subtitle: "Software Engineer",
            paragraph: "Kieran has worked with some of the world’s most cutting-edge technology as a Software Engineer…"
        )
    }
}
