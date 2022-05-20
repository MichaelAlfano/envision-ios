//
//  DefaultsManager.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/10/22.
//

import Foundation
import SwiftUI
import UIKit

class DefaultsManager {
    let defaults = UserDefaults.standard
    
    private func getRawKey(_ key: DefaultKeys) -> String {
        switch key {
        case .launchCount:
            return RawKeys.LAUNCH_COUNT
        case .photoData:
            return RawKeys.PHOTO_DATA
        case .name:
            return RawKeys.NAME
        case .career:
            return RawKeys.CAREER
        case .whoIAm:
            return RawKeys.WHO_I_AM
        case .whySTEM:
            return RawKeys.WHY_STEM
        case .usingSTEM:
            return RawKeys.USING_STEM
        case .advice:
            return RawKeys.ADVICE
        case .careerInterests:
            return RawKeys.CAREER_INTERESTS
        case .fieldInterests:
            return RawKeys.FIELD_INTERESTS
        }
    }
    
    func setInt(_ key: DefaultKeys, _ value: Int) {
        defaults.set(value, forKey: getRawKey(key))
    }
    
    func getInt(_ key: DefaultKeys) -> Int {
        return defaults.integer(forKey: getRawKey(key)) 
    }
    
    func setString(_ key: DefaultKeys, _ value: String) {
        defaults.set(value, forKey: getRawKey(key))
    }
    
    func getString(_ key: DefaultKeys) -> String {
        return defaults.string(forKey: getRawKey(key)) ?? ""
    }
    
    func setArray(_ key: DefaultKeys, _ value: Array<String>) {
        defaults.set(value, forKey: getRawKey(key))
    }
    
    func getArray(_ key: DefaultKeys) -> Array<String> {
        return defaults.array(forKey: getRawKey(key)) as? [String] ?? []
    }
}

enum DefaultKeys: String {
    case launchCount
    case photoData
    case name
    case career
    case whoIAm
    case whySTEM
    case usingSTEM
    case advice
    case careerInterests
    case fieldInterests
}

fileprivate class RawKeys {
    static let LAUNCH_COUNT = "launch-count"
    static let PHOTO_DATA = "photoData"
    static let NAME = "name"
    static let CAREER = "career"
    static let WHO_I_AM = "who-i-am"
    static let WHY_STEM = "why-stem"
    static let USING_STEM = "using-stem"
    static let ADVICE = "advice"
    static let CAREER_INTERESTS = "career-interests"
    static let FIELD_INTERESTS = "field-interests"
}
