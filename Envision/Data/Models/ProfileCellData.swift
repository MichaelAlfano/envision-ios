//
//  ProfileCellData.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/12/22.
//

import SwiftUI

struct ProfileCellData: Identifiable {
    var id = UUID()
    var image: Image
    var title: String
    var subtitle: String
    var paragraph: String
    var interests: Interests
}
