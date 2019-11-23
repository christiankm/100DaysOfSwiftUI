//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Christian Mitteldorf on 23/11/2019.
//  Copyright © 2019 Mitteldorf. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?


    public var wrappedName: String {
        name ?? "Unknown Candy"
    }
}
