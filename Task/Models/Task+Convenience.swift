//
//  Task+Convenience.swift
//  Task
//
//  Created by Jordan Lamb on 9/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due as Date?
        self.isComplete = isComplete
    }
}
