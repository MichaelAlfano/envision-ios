//
//  DefaultsManager.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import Foundation

class DefaultsManager {
    let defaults = UserDefaults.standard
    
    private func getRawKey(_ key: DefaultKeys) -> String {
        switch key {
        case .launchCount:
            return RawKeys.LAUNCH_COUNT
        }
    }
    
    func setInt(_ key: DefaultKeys, _ value: Int) {
        defaults.set(value, forKey: getRawKey(key))
    }
    
    func getInt(_ key: DefaultKeys) -> Int? {
        return defaults.integer(forKey: getRawKey(key)) 
    }
    
}

enum DefaultKeys: String {
    case launchCount
}

fileprivate class RawKeys {
    static let LAUNCH_COUNT = "launch-count"
}

// How to to core data https://12ft.io/proxy?q=https%3A%2F%2Fbetterprogramming.pub%2Fhow-to-save-an-image-to-core-data-with-swift-a1105ae2cf04
