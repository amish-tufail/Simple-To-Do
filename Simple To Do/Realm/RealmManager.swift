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
}
