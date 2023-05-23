//
//  DisplayModels.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation

class PacksGroupDisplayModel: Hashable {
    let title: String

    init(title: String) {
        self.title = title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }

    static func == (lhs: PacksGroupDisplayModel, rhs: PacksGroupDisplayModel) -> Bool {
        lhs.title == rhs.title
    }
}

class PackDisplayModel: Hashable {
    let id: String
    let status: String

    init(id: String, status: String) {
        self.id = id
        self.status = status
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: PackDisplayModel, rhs: PackDisplayModel) -> Bool {
        lhs.id == rhs.id
    }
}
