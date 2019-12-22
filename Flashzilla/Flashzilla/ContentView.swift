//
//  ContentView.swift
//  Flashzilla
//
//  Created by Christian Mitteldorf on 19/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var cards = [Card](repeating: Card.example, count: 10)

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: self.cards[index], onRemove: {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        })
                        .stacked(at: index, in: self.cards.count)
                    }
                }
            }
        }
    }

    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
