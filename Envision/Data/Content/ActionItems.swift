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
        
        if !interests.wrappedValue.isComplete() {
            returnItems.append(ActionCellData(
                title: "Choose Interests",
                timeEstimate: "2 mins",
                view: AnyView(
                    InterestsView(
                        interests: interests,
                        stateInterests: interests.wrappedValue
                    )
                )
            ))
        }
        
        if !profile.wrappedValue.isComplete() {
            returnItems.append(ActionCellData(
                title: "Setup Profile",
                timeEstimate: "10 mins",
                view: AnyView(
                    SetupProfile(
                        profile: profile,
                        stateProfile: profile.wrappedValue,
                        defaultsManager: defaultsManager
                    )
                )
            ))
        }
        
        return returnItems
    }
}
