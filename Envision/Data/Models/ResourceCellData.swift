//
//  ResourceCellData.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import Foundation

struct ResourceCellData: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var subtitle: String
    var paragraph: String
    var url: URL?
}
