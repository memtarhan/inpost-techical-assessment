//
//  RealmInstance.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 24/05/2023.
//

import Foundation
import RealmSwift

class RealmInstance {
    private(set) var shared: Realm

    init(shared: Realm) {
        self.shared = shared
    }
}
