//
//  View+Stacked.swift
//  Flashzilla
//
//  Created by Christian Mitteldorf on 22/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

extension View {

    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
