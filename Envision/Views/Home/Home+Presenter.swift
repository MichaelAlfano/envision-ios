//
//  Home+Presenter.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/15/22.
//

import SwiftUI
import MessageUI

class HomePresenter: ObservableObject {
    
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
    
    func emailAction() {
        EmailHelper.shared.sendEmail(to: "michaelalfano2004@gmail.com")
    }
    
    func openResource(url: URL?) {
        SFSafariHelper(url: url).present()
    }
    
    func linkedInAction() {
        let webURL = URL(string: "https://www.linkedin.com/in/michaelalfan0/")!
        UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
    }
    
    func apsWebsiteAction() {
        openResource(url: URL(string: "https://aps.org/"))
    }
}

