//
//  MKPointAnnotation+ObervableObject.swift
//  Bucket List
//
//  Created by Christian Mitteldorf on 05/12/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {

    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
}

