//
//  Haptics+Helper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import UIKit

/*
 MARK: Usage
 
 Haptics.play(.heavy)
 Haptics.play(.light)
 Haptics.play(.medium)
 Haptics.play(.rigid)
 Haptics.play(.soft)
                 
 Haptics.notify(.error)
 Haptics.notify(.success)
 Haptics.notify(.warning)
 */

class Haptics {
    static func play(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: feedbackStyle).impactOccurred()
    }
    
    static func notify(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(feedbackType)
    }
}
