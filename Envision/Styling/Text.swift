//
//  Text.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import SwiftUI

struct TextStyles {
    static let header1 = TextStyle(font: Fonts.header1, color: Colors.primaryText)
    
    static let title1 = TextStyle(font: Fonts.header1, color: Colors.primaryText)
    static let title2 = TextStyle(font: Fonts.title2, color: Colors.primaryText)
    static let title3 = TextStyle(font: Fonts.title3, color: Colors.primaryText)
    static let title4 = TextStyle(font: Fonts.title4, color: Colors.primaryText)
    static let title5 = TextStyle(font: Fonts.title5, color: Colors.primaryText)
    
    static let subtitle1 = TextStyle(font: Fonts.subtitle1, color: Colors.primaryText)
    static let subtitle2 = TextStyle(font: Fonts.subtitle2, color: Colors.secondaryText)
    static let subtitle3 = TextStyle(font: Fonts.subtitle3, color: Colors.secondaryText)
    
    static let footnote1 = TextStyle(font: Fonts.footnote1, color: Colors.primaryText)
    static let footnote2 = TextStyle(font: Fonts.footnote2, color: Colors.primaryText)
    
    static let placeholder = TextStyle(font: Fonts.subtitle3, color: Colors.placeholderText)
}

struct TextStyle {
    var font: Font
    var color: Color
}
