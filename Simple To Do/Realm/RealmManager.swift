//
//  RealmManager.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    // 1. Think realm as a box which we need to open to store data
    private(set) var localRealm: Realm? // private(set) means we can set this only in this class
    @Published private(set) var tasks: [Task] = []
    init() {
        openRealm()
    }
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
    }
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title" : taskTitle, "completed" : false]) // This task is from the Task class we made using Realm Protocols
                    localRealm.add(newTask)
                    getTask()
                    print("Added new task to Realm: \(newTask)")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func getTask() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id)) // This returns the specified task with the id to update
                guard !taskToUpdate.isEmpty else {
                    return
                }
                try localRealm.write{
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("Task update with id: \(id)")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id)) // This returns the specified task with the id to update
                guard !taskToUpdate.isEmpty else {
                    return
                }
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTask()
                    print("Task deleted with id: \(id)")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
