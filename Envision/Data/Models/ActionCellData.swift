//
//  ActionCellData.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/12/22.
//

import SwiftUI

struct ActionCellData: Identifiable {
    var id = UUID()
    var title: String
    var timeEstimate: String
    var view: AnyView
}
