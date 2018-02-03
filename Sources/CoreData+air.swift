//
//  CoreData+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-02-02.
//  Copyright © 2018 airg. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    static var entityName: String {
        return String(describing: self)
    }
}

protocol Createable {
    /// Your NSManagedObject subclass must conform to Createable AND be marked final for this to work
    static func create(in context: NSManagedObjectContext) -> Self
}

extension Createable where Self: NSManagedObject {
    static func create(in context: NSManagedObjectContext) -> Self {
        let item = NSEntityDescription.insertNewObject(forEntityName: self.entityName, into: context)
        return item as! Self
    }
}
