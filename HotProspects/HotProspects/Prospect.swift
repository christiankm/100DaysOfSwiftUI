//
//  Prospect.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 18/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

class Prospects: ObservableObject {

    static let saveKey = "SavedData"

    @Published private(set) var people: [Prospect]

    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }

        self.people = []
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
}

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}
