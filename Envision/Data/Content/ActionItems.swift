//
//  ActionItems.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

extension Content {
    static func actionItems(profile: Binding<ProfileData>, interests: Binding<Interests>, defaultsManager: DefaultsManager) -> [ActionCellData] {
        var returnItems: [ActionCellData] = []
        
        returnItems.append(ActionCellData(
            title: "Choose Interests",
            timeEstimate: "2 mins",
            view: AnyView(
                InterestsView(
                    interests: interests,
                    stateInterests: interests.wrappedValue
                )
            ),
            isComplete: interests.wrappedValue.isComplete()
        ))
        
        returnItems.append(ActionCellData(
            title: "Setup Profile",
            timeEstimate: "10 mins",
            view: AnyView(
                SetupProfile(
                    profile: profile,
                    stateProfile: profile.wrappedValue,
                    defaultsManager: defaultsManager
                )
            ),
            isComplete: profile.wrappedValue.isComplete()
        ))
        
        returnItems.sort(by: { !$0.isComplete && $1.isComplete })
        
        return returnItems
    }
}
