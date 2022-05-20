//
//  Interests.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/18/22.
//

import Foundation

public struct Interests: Equatable {
    var career: [String]
    var fields: [String]
    
    mutating func toggleCareer(_ interest: String) {
        if career.contains(interest) {
            self.career.removeAll(where: { $0 == interest })
        } else {
            if career.count < 3 {
                Haptics.play(.light)
                self.career.append(interest)
            } else {
                Haptics.notify(.error)
                AlertHelper.showAlert(title: "Invalid Selection", message: "Only select 3 items")
            }
        }
        DefaultsManager().saveInterests(self)
    }
    
    struct Career: Identifiable, Equatable {
        public var id = UUID()
        static let makingMoney = "Making Money"
        static let helpingOthers = "Helping Others"
        static let jobSecurity = "Having Job Security"
        static let workingWithPeople = "Working with people"
        static let familyTime = "Having lots of family time"
        static let excitingJob = "Having an exciting job"
        static let usingAbilities = "Making use of my abilities"
        
        static let careerOptions = [
            makingMoney,
            excitingJob,
            familyTime,
            helpingOthers,
            jobSecurity,
            usingAbilities,
            workingWithPeople
        ]
    }
    
    mutating func toggleField(_ interest: String) {
        if fields.contains(interest) {
            self.fields.removeAll(where: { $0 == interest })
        } else {
            if fields.count < 2 {
                Haptics.play(.light)
                self.fields.append(interest)
            } else {
                Haptics.notify(.error)
                AlertHelper.showAlert(title: "Invalid Selection", message: "Only select 2 items")
            }
        }
        DefaultsManager().saveInterests(self)
    }
    
    struct Fields: Identifiable, Equatable {
        public var id = UUID()
        static let medicine = "Medicine or Health"
        static let biology = "Biology"
        static let chemistry = "Chemistry"
        static let arts = "Arts or Media"
        static let astronomy = "Astronomy"
        static let engineering = "Engineering"
        static let english = "English or Writing"
        static let physics = "Physics"
        static let business = "Finance, Business or Consultancy"
        static let academia = "Academia or Education"
        static let law = "Law"
        static let computerScience = "Technology or Computer Science"
        static let administration = "Administration or Management"
        
        static let fieldOptions = [
            medicine,
            biology,
            chemistry,
            arts,
            astronomy,
            engineering,
            english,
            physics,
            business,
            academia,
            law,
            computerScience,
            administration
        ]
    }
}

extension Interests {
    func isComplete() -> Bool {
        return career.count == 3 && fields.count == 2
    }
}

extension Interests {
    func contains(_ otherInterests: Interests) -> Bool {
        return
            self.career.hasCommonValue(with: otherInterests.career) &&
            self.fields.hasCommonValue(with: otherInterests.fields)
    }
}

extension Array where Element == String {
    func hasCommonValue(with: Array) -> Bool {
        for value in self {
            if with.contains(value) {
                return true
            }
        }
        return false
    }
}

extension DefaultsManager {
    func getInterests() -> Interests {
        return Interests(
            career: getArray(.careerInterests),
            fields: getArray(.fieldInterests)
        )
    }
    
    func saveInterests(_ interests: Interests) {
        setArray(.fieldInterests, interests.fields)
        setArray(.careerInterests, interests.career)
    }
}
