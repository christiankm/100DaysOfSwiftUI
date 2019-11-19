//
//  ContentView.swift
//  Cupcakes
//
//  Created by Christian Mitteldorf on 19/11/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }

                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }

                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

//struct ContentView: View {
//
//    @State var results = [Result]()
//
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .onAppear(perform: loadData)
//    }
//
//    func loadData() {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                    // we have good data – go back to the main thread
//                    DispatchQueue.main.async {
//                        // update our UI
//                        self.results = decodedResponse.results
//                    }
//
//                    // everything is good, so we can exit
//                    return
//                }
//            }
//
//            // if we're still here it means there was a problem
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
