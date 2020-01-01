//
//  CustomAlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by Christian Mitteldorf on 01/01/2020.
//  Copyright © 2020 Mitteldorf. All rights reserved.
//

import SwiftUI

extension VerticalAlignment {

    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuides: View {
    var body: some View {
        HStack(alignment: VerticalAlignment.midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(VerticalAlignment.midAccountAndName)
                Image("paul-hudson")
                    .resizable()
                    .frame(width: CGFloat(64.0), height: CGFloat(64.0))
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
//                    .alignmentGuide(.midAccountAndName)
                    .font(.largeTitle)
            }
        }
    }
}

struct CustomAlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuides()
    }
}
