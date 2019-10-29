//
//  ContentView.swift
//  iExpense
//
//  Created by Christian Mitteldorf on 29/10/2019.
//  Copyright © 2019 mitteldorf. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ExampleContentView: View {
    @ObservedObject var user = User()

    @State private var showingSheet = false

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)

            Button("Show Sheet") {
                self.showingSheet.toggle()
            }
            .sheet(isPresented: self.$showingSheet) {
                SecondView(name: "Christian")
            }
        }
    }
}

struct SecondView: View {
    var name: String

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Hi \(name) 👋")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ExampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleContentView()
    }
}
