//
//  Card.swift
//  Flashzilla
//
//  Created by Christian Mitteldorf on 22/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        return Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
