//
//  Alert+Helper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

class AlertHelper {
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
    
    static func showAlert(title: String?, message: String?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        getRootViewController()?.present(ac, animated: true)
    }
}
