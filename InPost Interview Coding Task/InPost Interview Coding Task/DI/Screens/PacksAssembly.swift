//
//  PacksAssembly.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Swinject
import UIKit

class PacksAssembly: Assembly {
    func assemble(container: Container) {
        container.register(PacksViewController.self) { resolver in
            let view = PacksViewController.instantiate()
            let viewModel = resolver.resolve(PacksViewModel.self)!
            let model = resolver.resolve(PacksModel.self)!

            viewModel.model = model
            view.viewModel = viewModel

            return view
        }

        container.register(PacksViewModel.self) { _ in
            PacksViewModel()
        }

        container.register(PacksModel.self) { _ in
            PacksModel()
        }
    }
}
