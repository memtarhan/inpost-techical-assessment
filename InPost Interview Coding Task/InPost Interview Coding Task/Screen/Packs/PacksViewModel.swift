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

    typealias snapshotType = NSDiffableDataSourceSnapshot<PacksGroupDisplayModel, PackDisplayModel>
    private var snapshot = snapshotType()

    @Published var snapshotPublisher = PassthroughSubject<snapshotType, Never>()

    func load() {
        Task {
            do {
                // TODO: Handle grouping
                let packs = try await model.get()

                let group = PacksGroupDisplayModel(title: "Section 1")
                let displayModels = packs.map {
                    PackDisplayModel(id: $0.id,
                                     status: $0.status.rawValue,
                                     sender: $0.sender)
                }
                snapshot.appendSections([group])
                snapshot.appendItems(displayModels, toSection: group)
                snapshotPublisher.send(snapshot)

                let group2 = PacksGroupDisplayModel(title: "Section 1")
                let displayModels2 = packs.map {
                    PackDisplayModel(id: $0.id + "-0",
                                     status: $0.status.rawValue,
                                     sender: $0.sender)
                }
                snapshot.appendSections([group2])
                snapshot.appendItems(displayModels2, toSection: group2)

                snapshotPublisher.send(snapshot)

            } catch {
                // TODO: Display alert
                print("failed to fetch packs \(error.localizedDescription)")
            }
        }
    }

    func section(atIndexPath indexPath: IndexPath) -> PacksGroupDisplayModel {
        let index = indexPath.section
        return snapshot.sectionIdentifiers[index] // TODO: Add index-out-of-bounds check
    }
}
