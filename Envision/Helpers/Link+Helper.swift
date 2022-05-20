//
//  LinkHelper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import Foundation
import SwiftUI
import UIKit
import SafariServices

struct SFSafariHelper {
    let url: URL?
    
    func present() {
        if !verifyUrl(urlString: url?.absoluteString) { return }
        let viewController = SFSafariViewController(url: url!)
        getRootViewController()?.present(viewController, animated: true)
    }
    
    func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
    
    func verifyUrl(urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
