//
//  ContentView.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 11/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var prospects = Prospects()

    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
            }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
            }
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Image(systemName: "questionmark.diamond")
                    Text("Uncontacted")
            }
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
            }
        }
        .environmentObject(prospects)
    }
}

//struct ContentView: View {
//    @State private var backgroundColor = Color.red
//
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .padding()
//                .background(backgroundColor)
//
//            Text("Change Color")
//                .padding()
//                .contextMenu {
//                    Button(action: {
//                        self.backgroundColor = .red
//                    }) {
//                        Text("Red")
//                    }
//
//                    Button(action: {
//                        self.backgroundColor = .green
//                    }) {
//                        Text("Green")
//                    }
//
//                    Button(action: {
//                        self.backgroundColor = .blue
//                    }) {
//                        Text("Blue")
//                    }
//            }
//        }
//    }
//}

//struct ContentView: View {
//
//    let user = User()
//
//    @State private var selectedTab = 0
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            VStack {
//                Image("example")
//                    .interpolation(.none)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(maxHeight: .infinity)
//                    .background(Color.black)
//                    .edgesIgnoringSafeArea(.all)
//                EditView()
//                DisplayView()
//            }
//                .environmentObject(user)
//                .onTapGesture {
//                    self.selectedTab = 1
//                }
//                .tabItem {
//                    Image(systemName: "star")
//                    Text("One")
//                }
//                .tag(0)
//            Text("Hello 2")
//                .tabItem {
//                    Image(systemName: "star.fill")
//                    Text("Two")
//                }
//                .tag(1)
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
