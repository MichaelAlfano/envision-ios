//
//  String+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
