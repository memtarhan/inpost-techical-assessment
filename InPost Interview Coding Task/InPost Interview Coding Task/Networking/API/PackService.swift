//
//  PackService.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation

protocol PackServiceProtocol: APICallable {
    func get() async throws -> [PackResponse]
}

class PackService: PackServiceProtocol {
    func get() async throws -> [PackResponse] {
        let url = Bundle.main.url(forResource: "packs", withExtension: "json")!
        let (data, _) = try await session.data(from: url)
        return try decoder.decode([PackResponse].self, from: data)
    }
}
