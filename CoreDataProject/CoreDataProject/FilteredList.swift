//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Christian Mitteldorf on 23/11/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {

    var fetchRequest: FetchRequest<T>
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        self.fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
        )
        self.content = content
    }

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList(filterKey: "lastName", filterValue: "A", content: )
//    }
//}
