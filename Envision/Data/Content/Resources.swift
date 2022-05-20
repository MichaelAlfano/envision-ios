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
            imageName: Assets.Images.aps,
            title: "Careers in Physics",
            subtitle: "American Physical Society",
            paragraph: "“The APS is a nonprofit organization working to advance and diffuse the knowledge of physics…”", url: URL(string: "https://www.aps.org/careers/index.cfm")
        ),
        ResourceCellData(
            imageName: Assets.Images.phet,
            title: "PhET Simulations",
            subtitle: "The University of Colorado",
            paragraph: "“PhET is an ongoing effort to provide an extensive suite of simulations to improve the way that STEM is taught and learned…”", url: URL(string: "https://phet.colorado.edu/en/simulations/filter?type=html,prototype")
        )
    ]
}
