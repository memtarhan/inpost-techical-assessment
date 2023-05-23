//
//  PacksViewModel.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Combine
import UIKit

class PacksViewModel {
    var model: PacksModel!

    func load() {
        Task {
            do {
                let packs = try await model.get()
                print(packs)
            } catch {
                // TODO: Display alert
                print("failed to fetch packs \(error.localizedDescription)")
            }
        }
    }
}
