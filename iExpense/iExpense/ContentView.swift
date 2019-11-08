//
//  ContentView.swift
//  iExpense
//
//  Created by Christian Mitteldorf on 29/10/2019.
//  Copyright © 2019 mitteldorf. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var expenses = Expenses()

    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeRows)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton())
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }

    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
