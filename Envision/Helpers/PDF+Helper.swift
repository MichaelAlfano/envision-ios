//
//  PDF+Helper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/17/22.
//

import SwiftUI
import PDFKit

struct PDF {
    static func exportToPDF(profile: ProfileData, image: Image?) {
        let pageSize = CGSize(width: UIScreen.main.bounds.height/1.25, height: UIScreen.main.bounds.height*1.25)
        
        //View to render on PDF
        let myUIHostingController = UIHostingController(rootView: Profile(profile: profile, photo: image))
        myUIHostingController.view.frame = CGRect(origin: .zero, size: pageSize)
        
        //Render the view behind all other views
        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else {
            print("ERROR: Could not find root ViewController.")
            return
        }
        rootVC.addChild(myUIHostingController)
        //at: 0 -> draws behind all other views
        //at: UIApplication.shared.windows.count -> draw in front
        rootVC.view.insertSubview(myUIHostingController.view, at: 0)
        
        
        //Render the PDF
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(origin: .zero, size: pageSize))

        // Exporting
         let data = pdfRenderer.pdfData { (context) in
            context.beginPage()
            myUIHostingController.view.layer.render(in: context.cgContext)
        }
        
        guard let source = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        let vc = UIActivityViewController(
            activityItems: [data],
            applicationActivities: nil
        )
        vc.completionWithItemsHandler  = { activity, success, items, error in
            myUIHostingController.view.frame = CGRect(origin: .zero, size: .zero)
            UINavigationBar.appearance().tintColor = .clear
        }
        UINavigationBar.appearance().tintColor = .systemBlue
        vc.popoverPresentationController?.sourceView = source.view
        source.present(vc, animated: true)
    }
    
    static func share(
        items: [Any],
        excludedActivityTypes: [UIActivity.ActivityType]? = nil
    ) {
        guard let source = UIApplication.shared.windows.first?.rootViewController else {
            return
        }
        let vc = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        vc.completionWithItemsHandler  = { activity, success, items, error in
            vc.dismiss(animated: false)
            vc.removeFromParent()
        }
        vc.excludedActivityTypes = excludedActivityTypes
        vc.popoverPresentationController?.sourceView = source.view
        source.present(vc, animated: true)
    }
}

