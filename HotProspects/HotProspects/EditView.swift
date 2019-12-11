//
//  EditView.swift
//  HotProspects
//
//  Created by Christian Mitteldorf on 11/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import SwiftUI

struct EditView: View {

    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
