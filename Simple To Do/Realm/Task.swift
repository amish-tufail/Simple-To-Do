//
//  Task.swift
//  Simple To Do
//
//  Created by Amish Tufail on 21/02/2023.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable { // These protocols are from Realm
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
