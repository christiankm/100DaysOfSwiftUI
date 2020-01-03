//
//  Resort.swift
//  SnowSeeker
//
//  Created by Christian Mitteldorf on 03/01/2020.
//  Copyright © 2020 Mitteldorf. All rights reserved.
//

import Foundation

struct Resort: Codable, Identifiable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]

    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
}
