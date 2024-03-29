//
//  ScrollViewEffects.swift
//  LayoutAndGeometry
//
//  Created by Christian Mitteldorf on 01/01/2020.
//  Copyright © 2020 Mitteldorf. All rights reserved.
//

import SwiftUI

struct ScrollViewEffects: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(self.colors[index % 7])
//                        .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY) / 5), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ScrollViewEffects_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewEffects()
    }
}
