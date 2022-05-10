//
//  Strings.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import Foundation

class Strings {
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
    }
    
    struct Profile {
        static let TIME = "10 mins"
        static let TITLE = "Setup Profile"
        
        struct WhoIAm {
            static let TITLE = "Who I am"
            static let PLACEHOLDER = "Describe who you are and aspects of your background that are important to you."
        }
        
        struct WhyStem {
            static let TITLE = "Why STEM"
            static let PLACEHOLDER = "Give a brief background including how you became interested in STEM, the degree(s) you earned(if any), and the steps you took to reach your career through STEM."
        }
        
        struct UsingStem {
            static let TITLE = "Using STEM"
            static let PLACEHOLDER = "Describe the skills and traits from your STEM related degree that you use in your career. Describe ways you have contributed to your field, or ways your work benefits others, or interesting projects/accomplishments that have occurred in your career."
        }
        
        struct AdviceForStudents {
            static let TITLE = "Advice For Students"
            static let PLACEHOLDER = "Suggest ways for students to pursue their career goals using a STEM related degree, what they may not know about STEM, etc."
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
    }
    
    struct Onboarding {
        struct Slide1 {
            static let TITLE = "Discover\nPossibilities"
            static let SUB_TITLE = "We match your interests with those of industry professionals to show you career and educational pathways that you might be interested in."
        }
        
        struct Slide2 {
            static let TITLE = "Share\nYour Story"
            static let SUB_TITLE = "Put your past on paper, envision your future, or give advice to others who are following your path. Design, save, share."
        }
    }
    
    struct Navigation {
        static let NEXT = "NEXT"
        static let FINISH = "FINISH"
    }
    
    static let VIEW_ALL = "View All"
    static let RESOURCES_TITLE = "Resources"
    static let INDUSTRY_INFORMATION = "Industry Information"
}
