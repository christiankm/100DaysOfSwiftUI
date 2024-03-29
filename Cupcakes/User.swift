//
//  User.swift
//  Cupcakes
//
//  Created by Christian Mitteldorf on 19/11/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import Foundation

class User: ObservableObject, Codable {

    enum CodingKeys: CodingKey {
        case name
    }

    @Published var name = "Paul Hudson"

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
