//
//  Prospect.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 18/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

class Prospects: ObservableObject {
    @Published var people: [Prospect]

    init() {
        self.people = []
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
    }
}

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}
