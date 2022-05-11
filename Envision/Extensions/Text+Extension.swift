//
//  Text+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

extension Text {
    func styling(_ style: TextStyle) -> Text {
        self
            .font(style.font)
            .foregroundColor(style.color)
    }
}
