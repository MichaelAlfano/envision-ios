//
//  ProfileData.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import Foundation
import SwiftUI
// import CoreData

public struct ProfileData: Equatable, Identifiable {
    public static func == (lhs: ProfileData, rhs: ProfileData) -> Bool {
        return
            lhs.photo == rhs.photo &&
            lhs.name == rhs.name &&
            lhs.career == rhs.career &&
            lhs.whoIAm == rhs.whoIAm &&
            lhs.whyPhysics == rhs.whyPhysics &&
            lhs.usingPhysics == rhs.usingPhysics &&
            lhs.adviceForStudents == rhs.adviceForStudents &&
            lhs.field == rhs.field &&
            lhs.careerFactors == rhs.careerFactors
    }
    
    public let id: UUID
    var photo: Image?
    var name: String
    var career: String
    var whoIAm: String
    var whyPhysics: String
    var usingPhysics: String
    var adviceForStudents: String
    var field: [String]
    var careerFactors: [String]
    
    init(id: UUID = UUID(), photo: Image, name: String, career: String, whoIAm: String, whyPhysics: String, usingPhysics: String, adviceForStudents: String, field: [String], careerFactors: [String]) {
        self.id = id
        self.photo = photo
        self.name = name
        self.career = career
        self.whoIAm = whoIAm
        self.whyPhysics = whyPhysics
        self.usingPhysics = usingPhysics
        self.adviceForStudents = adviceForStudents
        self.field = field
        self.careerFactors = careerFactors
    }
    
    init(id: UUID = UUID(), photo: Image, name: String, career: String, whoIAm: String, whyPhysics: String, usingPhysics: String, adviceForStudents: String) {
        self.id = id
        self.photo = photo
        self.name = name
        self.career = career
        self.whoIAm = whoIAm
        self.whyPhysics = whyPhysics
        self.usingPhysics = usingPhysics
        self.adviceForStudents = adviceForStudents
        self.field = []
        self.careerFactors = []
    }
    
    func isComplete() -> Bool {
        return photo != nil && !name.isBlank && !career.isBlank && !whoIAm.isBlank && !whyPhysics.isBlank && !usingPhysics.isBlank && !adviceForStudents.isBlank
    }
}

extension ProfileData {
    func toCellData() -> ProfileCellData {
        return ProfileCellData(
            id: id,
            image: photo ?? Image(AppAssets.Images.onboarding2),
            title: name,
            subtitle: career,
            paragraph: whoIAm,
            interests: Interests(
                career: careerFactors,
                fields: field
            )
        )
    }
    
    static func placeholder() -> ProfileData {
        return ProfileData(
            photo: Image(AppAssets.Images.placeholerProfile),
            name: Strings.Profile.NAME,
            career: Strings.Profile.CAREER,
            whoIAm: Strings.Profile.WhoIAm.PLACEHOLDER,
            whyPhysics: Strings.Profile.WhyPhysics.PLACEHOLDER,
            usingPhysics: Strings.Profile.UsingPhysics.PLACEHOLDER,
            adviceForStudents: Strings.Profile.AdviceForStudents.PLACEHOLDER,
            field: [
                Interests.Fields.computerScience
            ],
            careerFactors: [
                Interests.Career.excitingJob,
                Interests.Career.jobSecurity,
                Interests.Career.usingAbilities
            ]
        )
    }
    
    static func error() -> ProfileData {
        return ProfileData(
            photo: Image(AppAssets.Images.onboarding1), // TODO: Change this to empty profile icon
            name: "Error",
            career: "Could not load profile",
            whoIAm: "",
            whyPhysics: "",
            usingPhysics: "",
            adviceForStudents: "",
            field: [],
            careerFactors: []
        )
    }
}

extension DefaultsManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveImage(_ key: DefaultKeys, _ image: Image) {
//        if let data = image.asUIImage().jpegData(compressionQuality: 0.5) {
//            let filename = getDocumentsDirectory().appendingPathComponent(getRawKey(key)+".png")
//            try? data.write(to: filename)
//        }
    }

    func loadImage(_ key: DefaultKeys) -> Image {
//        let fileURL = getDocumentsDirectory().appendingPathComponent(getRawKey(key)+".png")
//        do {
//            let imageData = try Data(contentsOf: placeholerProfile)
//            return Image(uiImage: UIImage(data: imageData) ?? UIImage(named: Assets.Images.placeholerProfile)
//        } placeholerProfile}
        return Image(AppAssets.Images.placeholerProfile)
    }
    
    func getProfile() -> ProfileData {
        return ProfileData(
            photo: loadImage(.photoData),
            name: getString(.name),
            career: getString(.career),
            whoIAm: getString(.whoIAm),
            whyPhysics: getString(.whyPhysics),
            usingPhysics: getString(.usingPhysics),
            adviceForStudents: getString(.advice)
        )
    }
    
    func updateProfile(_ profile: ProfileData) {
        setString(.name, profile.name)
        setString(.career, profile.career)
        setString(.whoIAm, profile.whoIAm)
        setString(.whyPhysics, profile.whyPhysics)
        setString(.usingPhysics, profile.usingPhysics)
        setString(.advice, profile.adviceForStudents)
    }
    
    func updateProfilePhoto(_ profilePhoto: Image) {
        saveImage(.photoData, profilePhoto)
    }
}
