//
//  Profiles.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import SwiftUI

extension Content {
    static let profiles: [ProfileData] = [
        ProfileData(
            photo: Image(AppAssets.Images.michael),
            name: "Michael Alfano",
            career: "Software Engineer",
            whoIAm: "I am a software engineer at the NASA Jet Propulsion Laboratory currently working on the Kepler-442b rover project. Previously, I have worked as a software engineer at Tesla and the NSA. I focus on database architecture and machine learning, specifically computer vision. The most important thing to me is to help others through computer software",
            whySTEM: "Since I was in middle school I have loved math, science, and technology and after taking physics my freshmen year I fell in love with it. The subject satisfied all of the characteristics I was looking for in a career which lead me to get a physics minor in addition to a major in computer science. In my physics education, I developed the skills and knowledge base that I needed in my future career. Through years of studying and honing my skills along with many internships and other jobs I have finally ended up with my dream job at NASA.",
            usingSTEM: "Having a minor in physics has allowed me to be a better team member in organizations such as the NSA, NASA, and Tesla. Through my minor I not only learned the critical theories of physics, but I also developed my problem solving skills which are extremely useful in the field of software engineering. In my time in the field of computer science I have contributed to Tesla FSD Beta 9.5 through the official release of FSD to all Tesla owners with the FSD package. I have also contributed at the NSA where I worked to protect the cybersecurity of US pipelines, including the Colonial Pipeline, in addition to working on various homeland security projects.",
            adviceForStudents: "Physics is an expansive field with many different career options. Even if you don’t plan to be a physicist the skills you develop through a physics education will prepare you for almost any field. With an education in physics you can pursue a career in any of the following fields: healthcare, finance, journalism, teaching, software development, law, and more.",
            field: [
                Interests.Fields.arts,
                Interests.Fields.astronomy,
                Interests.Fields.business,
                Interests.Fields.academia,
                Interests.Fields.computerScience
            ],
            careerFactors: [
                Interests.Career.makingMoney,
                Interests.Career.helpingOthers,
                Interests.Career.excitingJob
            ]
        ),
        ProfileData(
            photo: Image(AppAssets.Images.hussien),
            name: "Hussien Tannira",
            career: "Neurosurgeon",
            whoIAm: "I am Hussien, a surgeon specialized in the nervous system, especially the brain and spinal cord. One of my main interests and important to me at the same time is saving people’s lives and giving them hope after losing it.",
            whySTEM: "So many reasons! First of all, it is one of the most underdeveloped specialties of surgery, as there are still many mysteries of the brain and nervous system that have not been discovered by man until now and regardless of the previous reason, it’s been my dream since I was a kid so I worked really hard to get the highest degrees I could get. ",
            usingSTEM: "I’ve been working on finding what does the brain, neurons and nerve signals have to do with cancer causes while I am sure that every single organ in the living body is being controlled by some nerve signals coming out from the brain.",
            adviceForStudents: "Being a doctor - a surgeon specifically - is one the hardest thing to do and one of the easiest at the same time, studying medicine and going on to complete your studies to become a surgeon only needs to never give up. Consider helping your society and developing your world is one of your main responsibilities, this would work as a big motivation for you. Best of luck.",
            field: [
                Interests.Fields.medicine,
                Interests.Fields.biology,
                Interests.Fields.chemistry
            ],
            careerFactors: [
                Interests.Career.excitingJob,
                Interests.Career.makingMoney,
                Interests.Fields.law,
                Interests.Fields.english,
                Interests.Career.usingAbilities
            ]
        ),
        ProfileData(
            photo: Image(AppAssets.Images.amos),
            name: "Amos Smithwick",
            career: "Structural Engineer",
            whoIAm: "I am a structural engineer; I make sure buildings won’t turn into piles of rubble for a living. I have a passion for music, running, and physics! I am a creative and serious person who enjoys solving problems and being challenged. ",
            whySTEM: "I discovered my love for physics when I took it in high school, which was my first time experiencing the field of study. It was really interesting to actually understand a little bit about why things happen the way they do and how the world works. I earned a BS in physics from the University of Chicago and then applied for a job as a structural engineer.",
            usingSTEM: "Being a structural engineer means that I figure out how to build things using many kinds of materials and am basically responsible for making sure the resulting buildings don’t fall over. I focus on the framework and make sure it can withstand environmental hazards and is structurally sound. I need to use my understanding of physics and math to predict and calculate how different materials will perform in any given situation. Whether or not people realize it, my work affects anyone who enters one of the structures I’ve worked on. They’re kept safe by a building that is well-suited to its environment and planned to perfection.",
            adviceForStudents: "A physics degree is really useful. You don’t just have to be working with particle accelerators or mind-boggling whiteboards full of equations (although you can if you want) if you pursue one. There are many areas where it is applicable, whether that be in related fields like engineering or in any position where an intelligent person with problem-solving skills is needed.",
            field: [
                Interests.Fields.engineering,
                Interests.Fields.administration,
                Interests.Fields.physics
            ],
            careerFactors: [
                Interests.Career.usingAbilities,
                Interests.Career.makingMoney,
                Interests.Career.excitingJob,
                Interests.Career.familyTime,
                Interests.Career.helpingOthers,
                Interests.Career.workingWithPeople,
                Interests.Career.jobSecurity
            ]
        )
    ]
}

/*
 
 Blank copy
 
 ProfileData(
     photo: <#T##Image#>,
     name: <#T##String#>,
     career: <#T##String#>,
     whoIAm: <#T##String#>,
     whySTEM: <#T##String#>,
     usingSTEM: <#T##String#>,
     adviceForStudents: <#T##String#>,
     field: <#T##String#>,
     careerFactors: <#T##[String]#>
 )
 */
