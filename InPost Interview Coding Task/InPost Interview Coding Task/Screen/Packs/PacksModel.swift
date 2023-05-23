//
//  PacksModel.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation

struct PacksModel {
    private let service: PacksServiceProtocol

    init(service: PacksServiceProtocol) {
        self.service = service
    }

    func get() async throws -> [PackResponse] {
        try await service.get()
    }
}
