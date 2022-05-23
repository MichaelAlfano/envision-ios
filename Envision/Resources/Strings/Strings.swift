//
//  Strings.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import Foundation

struct Strings {
    struct App {
        static let NAME = "Envision"
        static let SLOGAN = "If You Can See It, You Can Be It."
    }
    
    struct Home {
        static let SCREEN_TITLE = "Welcome"
        static let SCREEN_SUBTITLE = "The following items require your action."
    }
    
    struct Interests {
        static let TIME = "2 mins"
        static let TITLE = "Choose Interests"
        
        static let SATISFACTION_TITLE = "Career Satisfaction"
        static let SATISFACTION_SUBTITLE = "Choose the 3 most important factors for your future career satisfaction."
        static let FIELDS_TITLE = "Fields of Interest"
        static let FIELDS_SUBTITLE = "Choose the 2 fields you are most interested in."
    }
    
    struct Profile {
        static let PROFILE = "Profile"
        
        static let TIME = "10 mins"
        static let TITLE = "Setup Profile"
        
        static let NAME = "Name"
        static let CAREER = "Career"
        
        static let PLACEHOLDER_ITEM = "Enter your response here."
        
        struct WhoIAm {
            static let TITLE = "Who I am"
            static let PLACEHOLDER = "Describe who you are and aspects of your background that are important to you."
        }
        
        struct WhyPhysics {
            static let TITLE = "Why Physics"
            static let PLACEHOLDER = "Give a brief background including how you became interested in physics, the degree(s) you earned, and the steps you took to reach your career through physics."
        }
        
        struct UsingPhysics {
            static let TITLE = "Using Physics"
            static let PLACEHOLDER = "Describe the skills and traits from your physics degree(s) that you use in your career. Describe ways you have contributed to your field, or ways your work benefits others, or interesting projects/accomplishments that have occurred in your career."
        }
        
        struct AdviceForStudents {
            static let TITLE = "Advice For Students"
            static let PLACEHOLDER = "Suggest ways for students to pursue their career goals using a physics degree, what they may not know about Physics, etc."
        }
    }
    
    struct Professionals {
        static let TITLE = "Industry Professionals"
        static let SUBTITLE_ONE = "Filter by"
        static let SUBTITLE_TWO = "Interests"
        static let SUBTITLE_THREE = "or"
        static let SUBTITLE_FOUR = "All"
    }
    
    struct MadeBy {
        static let TITLE = "Envision was made by"
        static let NAME = "Michael Alfano"
        static let LINKEDIN = "Linked In"
        static let EMAIL = "Email"
    }
    
    struct Onboarding {
        struct Slide1 {
            static let TITLE = "Discover\nPossibilities"
            static let SUB_TITLE = "We match your interests with those of industry professionals to show you career and educational pathways that you might be interested in."
            static let BUTTON = "NEXT"
        }
        
        struct Slide2 {
            static let TITLE = "Share\nYour Story"
            static let SUB_TITLE = "Put your past on paper, envision your future, or give advice to others who are following your path. Export your profile as a PDF directly from the app."
            static let BUTTON = "FINISH"
        }
    }
    
    struct Navigation {
        static let NEXT = "NEXT"
        static let FINISH = "FINISH"
    }
    
    static let VIEW_ALL = "View All"
    static let RESOURCES_TITLE = "Resources"
    static let INDUSTRY_INFORMATION = "Industry Information"
    
    static let NEXT = "NEXT"
    static let BACK = "BACK"
    static let FINISH = "FINISH"
    
    static let EXPORT = "Export"
    static let TAKE_PHOTO = "Take Photo"
    static let CHOOSE_PHOTO = "Choose Photo"
    
    static let EDIT = "Edit"
    
    struct NoResults {
        static let TITLE = "No Results"
        static let NIL_TITLE = "0 Results"
        
        static let SUBTITLE = "No results for your selection"
        static let PARAGRAPH = "We are constantly improving our database and will have a professional that matches your interests soon."
    }
}
