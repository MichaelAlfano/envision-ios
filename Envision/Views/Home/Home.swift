//
//  ContentView.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/9/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text(Strings.Home.SCREEN_TITLE)
            .styling(TextStyles.header1)
            .padding()
    }
}

struct HomePreview: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
