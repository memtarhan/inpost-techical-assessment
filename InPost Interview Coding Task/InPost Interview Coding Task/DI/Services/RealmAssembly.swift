//
//  RealmAssembly.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 24/05/2023.
//

import Foundation
import RealmSwift
import Swinject

class RealmAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RealmInstance.self) { _ in
            /// Customize Realm instance here
            Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "AppName"
            let realm = try! Realm()
            let instance = RealmInstance(shared: realm)

            return instance
        }
    }
}
