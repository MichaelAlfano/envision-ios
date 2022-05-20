//
//  UIView+Extension.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import SwiftUI

extension UIView {
    public func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
