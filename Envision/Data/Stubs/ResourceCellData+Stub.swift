//
//  ResourceCellData+Stub.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import Foundation

extension ResourceCellData {
    static func stub() -> ResourceCellData {
        return ResourceCellData (
            imageName: Assets.Images.testProffesional,
            title: "Kieran Hissa",
            subtitle: "Software Engineer",
            paragraph: "“Kieran has worked with some of the world’s most cutting-edge technology as a Software Engineer…”",
            url: URL(string: "https://nasa.gov")
        )
    }
}
