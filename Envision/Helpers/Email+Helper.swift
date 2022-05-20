//
//  Email+Helper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/15/22.
//

import Foundation
import UIKit
import MessageUI

class EmailHelper: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailHelper()
    private override init() {
        //
    }
    
    func sendEmail(subject: String = "", body: String = "", to: String){
        if !MFMailComposeViewController.canSendMail() {
            // TODO: Add a way to show banner to user about no mail app found or configured
            // Utilities.showErrorBanner(title: "No mail account found", subtitle: "Please setup a mail account")
            return
        }
        
        let picker = MFMailComposeViewController()
        
        picker.setSubject(subject)
        picker.setMessageBody(body, isHTML: true)
        picker.setToRecipients([to])
        picker.mailComposeDelegate = self
        
        EmailHelper.getRootViewController()?.present(picker, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        EmailHelper.getRootViewController()?.dismiss(animated: true, completion: nil)
    }
    
    static func getRootViewController() -> UIViewController? {
        UIApplication.shared.windows.first?.rootViewController
    }
}
