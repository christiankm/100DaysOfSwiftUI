//
//  Response.swift
//  Cupcakes
//
//  Created by Christian Mitteldorf on 19/11/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
