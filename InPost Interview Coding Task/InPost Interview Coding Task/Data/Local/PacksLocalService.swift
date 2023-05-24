//
//  PacksLocalService.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 24/05/2023.
//

import Foundation
import RealmSwift

protocol PacksLocalServiceProtocol {
    func save(pack: PackDisplayModel) throws
    func get() -> Results<PackLocalModel>
}

class PacksLocalService: PacksLocalServiceProtocol {
    private let realmInstance: RealmInstance

    private lazy var realm: Realm = realmInstance.shared

    init(realmInstance: RealmInstance) {
        self.realmInstance = realmInstance
    }

    func save(pack: PackDisplayModel) throws {
        let object = PackLocalModel()
        object.id = pack.id
        object.status = pack.status
        object.sender = pack.sender
        object.shipmentType = "shipmentType"

        try realm.write { realm.add(object) }
    }

    func get() -> Results<PackLocalModel> {
        let objects = realm.objects(PackLocalModel.self)
        return objects
    }
}

enum LocalError: Error {
}
