//
//  EnvisionApp.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import SwiftUI

@main
struct EnvisionApp: App {
    
    let connector = Connector(
        defaultsManager: DefaultsManager()
    )
    
    var body: some Scene {
        WindowGroup {
            connector.makeRootView()
        }
    }
}
