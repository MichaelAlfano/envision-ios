//
//  ProfessionalsView+Presenter.swift
//  Envision STEM
//
//  Created by Michael Arthur Alfano on 5/20/22.
//

import SwiftUI

class ProfessionalsViewPresenter: ObservableObject {
    
    enum Filters {
        case interests
        case all
    }
    
    @Binding var profile: ProfileData
    @Binding var interests: Interests
    
    init(profile: Binding<ProfileData>, interests: Binding<Interests>) {
        _profile = profile
        _interests = interests
    }
    
    @Published var filter: Filters = .all
    
    var industryProfesionals: [ProfileCellData] {
        Content.profiles.map({ $0.toCellData() })
    }
    
    var resources: [ResourceCellData] {
        Content.resources
    }
    
    func actionItems(profile: Binding<ProfileData>, interests: Binding<Interests>, defaultsManager: DefaultsManager) -> [ActionCellData] {
        Content.actionItems(profile: profile, interests: interests, defaultsManager: defaultsManager)
    }
    
    func interestsAction() {
        if interests.isComplete() {
            Haptics.play(.light)
            filter = .interests
        } else {
            Haptics.notify(.error)
            AlertHelper.showAlert(title: "No Interests Found", message: "Add your interests to use this filter.")
        }
    }
    
    func allAction() {
        Haptics.play(.light)
        filter = .all
    }
}
