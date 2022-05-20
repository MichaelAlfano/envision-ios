//
//  UIApplication+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/17/22.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
