//
//  AstronautsView.swift
//  Moonshot
//
//  Created by Christian Mitteldorf on 07/11/2019.
//  Copyright © 2019 Christian Mitteldorf. All rights reserved.
//

import SwiftUI

struct AstronautsView: View {

    let astronaut: Astronaut

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name))
    }
}

struct AstronautsView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautsView(astronaut: astronauts[0])
    }
}
