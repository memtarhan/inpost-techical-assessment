//
//  PacksServiceAssembly.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Foundation
import Swinject

class PacksServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PacksServiceProtocol.self) { _ in
            PacksService()
        }
    }
}
