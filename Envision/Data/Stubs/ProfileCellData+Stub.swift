//
//  ProfileCellData+Stub.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/12/22.
//

import SwiftUI

extension ProfileCellData {
    static func stub() -> ProfileCellData {
        return ProfileCellData (
            image: Image(Assets.Images.testProffesional),
            title: "Kieran Hissa",
            subtitle: "Software Engineer",
            paragraph: "“Kieran has worked with some of the world’s most cutting-edge technology as a Software Engineer…”",
            interests: Interests(career: [], fields: [])
        )
    }
}
