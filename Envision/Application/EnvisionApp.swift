//
//  EnvisionApp.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import SwiftUI

@main
struct EnvisionApp: App {
    
    let connector: Connector = Connector(
        defaultsManager: DefaultsManager(),
        userData: UserData()
    )
    
    init() {
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .clear
        UITextView.appearance().backgroundColor = .clear
        UIScrollView.appearance().keyboardDismissMode = .onDrag
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                connector.makeRootView()
            }
        }
    }
}
