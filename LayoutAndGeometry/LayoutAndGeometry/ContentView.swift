//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Christian Mitteldorf on 01/01/2020.
//  Copyright © 2020 Mitteldorf. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
////        Text("Hello, World!")
////            .padding(20)
////            .background(Color.red)
//
////        Text("Live long and propser")
////            .frame(width: 300, height: 300, alignment: .topLeading)
//
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
//        }
//        .background(Color.red)
//        .frame(width: 400, height: 400)
//        .background(Color.blue)
//    }
//}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
            }
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
