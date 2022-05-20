//
//  UIImage+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

extension UIImage {
    var data: Data? {
        if let data = self.jpegData(compressionQuality: 1.0) {
            return data
        } else {
            return nil
        }
    }
}
