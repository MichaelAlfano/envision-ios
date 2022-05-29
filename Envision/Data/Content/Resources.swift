//
//  Resources.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/16/22.
//

import Foundation

struct Content {
    static let resources: [ResourceCellData] = [
        ResourceCellData(
            imageName: AppAssets.Images.aps,
            title: "Careers in Physics",
            subtitle: "American Physical Society",
            paragraph: "“The APS is a nonprofit organization working to advance and diffuse the knowledge of physics…”",
            url: URL(string: "https://www.aps.org/careers/index.cfm")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.phet,
            title: "PhET Simulations",
            subtitle: "The University of Colorado",
            paragraph: "“PhET is an ongoing effort to provide an extensive suite of simulations to improve the way that STEM is taught and learned…”",
            url: URL(string: "https://phet.colorado.edu/en/simulations/filter?type=html,prototype")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.usnews,
            title: "US News",
            subtitle: " Ilana Kowarski",
            paragraph: "“What You Can Do With a Physics Degree - A physics degree can lead to a career as an inventor, researcher or teacher.“",
            url: URL(string: "https://www.usnews.com/education/best-graduate-schools/articles/what-can-you-do-with-a-physics-degree")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.universeMore,
            title: "Universe And More",
            subtitle: "Matthew Blackman",
            paragraph: "Universe and More has a collection of interactive Physics resources such as Polarity Shift, Energy Bar Charts and more.",
            url: URL(string: "https://www.universeandmore.com/")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.aapt,
            title: "AAPT",
            subtitle: "American Association of Physics Teachers",
            paragraph: "“A professional membership association of scientists dedicated to enhancing the understanding and appreciation of physics through teaching.“",
            url: URL(string: "https://www.aapt.org/")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.donLincoln,
            title: "Dr. Don Lincoln",
            subtitle: "Educational Videos",
            paragraph: "YouTube videos and Ted Talks by physicist Dr. Don Lincoln on particle physics, cosmology, and more.",
            url: URL(string: "https://drdonlincoln.com/videos")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.sixtySymbols,
            title: "Sixty Symbols",
            subtitle: "Educational Videos",
            paragraph: "“Videos describing the various symbols used in physics and astronomy.“",
            url: URL(string: "https://www.youtube.com/user/sixtysymbols/featured")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.veritasium,
            title: "Veritasium",
            subtitle: "Educational Videos",
            paragraph: "“A channel of science and engineering videos featuring experiments, expert interviews, cool demos, and discussions with the public about everything science.“",
            url: URL(string: "https://www.veritasium.com/videos")
        ),
        ResourceCellData(
            imageName: AppAssets.Images.pbs,
            title: "PBS Space Time",
            subtitle: "Educational Videos",
            paragraph: "“Space Time explores the outer reaches of space, the craziness of astrophysics, the possibilities of sci-fi, and anything else you can think of beyond Planet Earth.“",
            url: URL(string: "https://www.pbs.org/show/pbs-space-time/")
        )
    ]
}
