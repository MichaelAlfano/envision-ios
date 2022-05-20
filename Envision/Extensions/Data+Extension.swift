//
//  Data+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

extension Data {
    var image: UIImage? {
        if let image = UIImage(data: self) {
            return image
        } else {
            return nil
        }
    }
}
