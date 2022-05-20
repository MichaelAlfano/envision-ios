//
//  ActionCellData+Stub.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/12/22.
//

import Foundation
import SwiftUI

extension ActionCellData {
    static func stub() -> ActionCellData {
        return ActionCellData(
            title: "Choose Interests",
            timeEstimate: "2 mins",
            view: AnyView(EmptyView())
        )
    }
}
