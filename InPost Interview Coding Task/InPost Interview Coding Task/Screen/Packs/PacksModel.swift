//
//  PacksModel.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation

struct PacksModel {
    private let service: PacksServiceProtocol
    private let localService: PacksLocalServiceProtocol

    init(service: PacksServiceProtocol, localService: PacksLocalServiceProtocol) {
        self.service = service
        self.localService = localService
    }

    func get() async throws -> [PackResponse] {
        try await service.get()
    }

    func save() {
        try? localService.save(pack: PackDisplayModel(id: "12", status: "", sender: ""))
        _ = localService.get()
    }
}
