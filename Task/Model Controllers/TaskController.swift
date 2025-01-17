//
//  TaskController.swift
//  Task
//
//  Created by Jordan Lamb on 9/25/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // Shared
    static let sharedInstance = TaskController()
    
    // SOT
//    var tasks: [Task] = mockTasks
    
    let fetchResultsController: NSFetchedResultsController<Task>
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let isComepleteSort = NSSortDescriptor(key: "isComplete", ascending: true)
        let dueSort = NSSortDescriptor(key: "due", ascending: false)
        fetchRequest.sortDescriptors = [isComepleteSort, dueSort]
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isComplete", cacheName: nil)
        fetchResultsController = resultsController
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("There was an error fetching from fetch Controller: \(error)")
        }
    }
    
    // CRUD
    
    // CREATE
    func add(taskWithName name: String, notes: String?, due: Date?) {
       let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    
    // UPDATE
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as Date?
        saveToPersistentStore()
    }
    
    //DELETE
    func remove(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
    }
    
    func toggleIsCompeteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    //SAVE
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    //LOAD
    
} // End of Class


let mockTasks: [Task] = {
    let task1 = Task(name: "Get groceries", notes: "Milk, Eggs, Meat", due: Date(timeIntervalSinceNow: 5000), isComplete: false)
    let task2 = Task(name: "Clean House", notes: "Room, Kitchen, Livingroom", due: Date(timeIntervalSinceNow: 6000), isComplete: false)
    let task3 = Task(name: "Mow Lawn", notes: "Mow Lawn", due: Date(timeIntervalSinceNow: 10000), isComplete: true)
    
    return [task1, task2, task3]
}()
