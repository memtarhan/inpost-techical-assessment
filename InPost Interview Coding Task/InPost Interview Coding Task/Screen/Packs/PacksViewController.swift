//
//  PacksViewController.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import Combine
import UIKit

class PacksViewController: UIViewController, NibLoadable {
    var viewModel: PacksViewModel!

    // MARK: - IBOutlets

    @IBOutlet var collectionView: UICollectionView!

    private lazy var dataSource = generatedDataSource

    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupSubscribers()

        viewModel.load()
    }

    private var generatedDataSource: UICollectionViewDiffableDataSource<PacksGroupDisplayModel, PackDisplayModel> {
        let dataSource = UICollectionViewDiffableDataSource<PacksGroupDisplayModel, PackDisplayModel>(collectionView: collectionView) { collectionView, indexPath, model in

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PackCollectionViewCell.identifier, for: indexPath) as? PackCollectionViewCell
            else { return UICollectionViewCell() }

            cell.configure(withPack: model)

            return cell
        }

        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PacksGroupHeaderView.reuseIdentifier, for: indexPath) as? PacksGroupHeaderView else {
                return UICollectionReusableView()
            }

            header.titleLabel.text = self.viewModel.section(atIndexPath: indexPath).title

            return header
        }

        return dataSource
    }
}

// MARK: Setups

private extension PacksViewController {
    func setupUI() {
        navigationItem.title = "Lista przesyłek"
        
        let cell = UINib(nibName: PackCollectionViewCell.identifier, bundle: nil)
        collectionView.register(cell, forCellWithReuseIdentifier: PackCollectionViewCell.identifier)

        let header = UINib(nibName: PacksGroupHeaderView.reuseIdentifier, bundle: nil)
        collectionView.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PacksGroupHeaderView.reuseIdentifier)

        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.collectionViewLayout = createComponsitionalLayout()
    }

    func setupSubscribers() {
        viewModel.snapshotPublisher
            .receive(on: DispatchQueue.main)
            .sink { snapshot in
                self.dataSource.apply(snapshot)
            }
            .store(in: &cancellables)
    }
}

// MARK: - ComponsitionalLayout

private extension PacksViewController {
    func createComponsitionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            self.createListSection()
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        layout.configuration = config

        return layout
    }

    // TODO: Move these sections to LayoutCommons
    func createListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 0, trailing: 8)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [createSectionHeader()]

        return section
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(36))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.pinToVisibleBounds = true

        return header
    }
}

// MARK: - UITableViewDelegate

extension PacksViewController: UICollectionViewDelegate {}
