//
//  DisplayView.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 11/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct DisplayView: View {

    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

//struct DisplayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DisplayView()
//    }
//}
