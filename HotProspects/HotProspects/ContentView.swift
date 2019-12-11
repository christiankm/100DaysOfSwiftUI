//
//  ContentView.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 11/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let user = User()

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                EditView()
                DisplayView()
            }
                .environmentObject(user)
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(0)
            Text("Hello 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
