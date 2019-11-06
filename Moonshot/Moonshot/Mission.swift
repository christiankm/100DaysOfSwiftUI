//
//  Mission.swift
//  Moonshot
//
//  Created by Christian Mitteldorf on 06/11/2019.
//  Copyright © 2019 Christian Mitteldorf. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
