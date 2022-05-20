//
//  ResourceCell.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/11/22.
//

import SwiftUI

struct ResourceCell: View {
    var photo: Image
    var title: String
    var subtitle: String
    var paragraph: String
    var action: () -> Void = { }
    
    var body: some View {
        Button(action: action, label: {
            ProfileCell(
                photo: photo,
                title: title,
                subtitle: subtitle,
                paragraph: paragraph
            )
        })
        .buttonStyle(Scale())
    }
}

struct ResourceCellPreviews: PreviewProvider {
    static var previews: some View {
        ResourceCell(
            photo: Image(Assets.Images.testProffesional),
            title: "Kieran Hissa",
            subtitle: "Software Engineer",
            paragraph: "Kieran has worked with some of the world’s most cutting-edge technology as a Software Engineer…",
            action: { }
        )
    }
}
