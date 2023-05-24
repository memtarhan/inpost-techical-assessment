//
//  PacksLocalServiceAssembly.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 24/05/2023.
//

import Foundation
import Swinject

class PacksLocalServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PacksLocalServiceProtocol.self) { resolve in
            PacksLocalService(realmInstance: resolve.resolve(RealmInstance.self)!)
        }
    }
}
