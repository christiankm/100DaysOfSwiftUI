//
//  AbsolutePositioning.swift
//  LayoutAndGeometry
//
//  Created by Christian Mitteldorf on 01/01/2020.
//  Copyright © 2020 Mitteldorf. All rights reserved.
//

import SwiftUI

struct AbsolutePositioning: View {

    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, World!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(Color.red)
            }
            .background(Color.green)

            Text("More text")
                .background(Color.blue)
        }
    }
}

struct AbsolutePositioning_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioning()
    }
}
