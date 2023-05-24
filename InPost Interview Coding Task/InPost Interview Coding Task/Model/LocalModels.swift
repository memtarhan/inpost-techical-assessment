//
//  LocalModels.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 24/05/2023.
//

import Foundation
import RealmSwift

class PackLocalModel: Object {
    @objc dynamic var id = ""
    @objc dynamic var status = ""
    @objc dynamic var sender = ""
    @objc dynamic var expiryDate: Date?
    @objc dynamic var pickupDate: Date?
    @objc dynamic var storedDate: Date?
    @objc dynamic var shipmentType = ""
}
