//
//  PackCollectionViewCell.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import UIKit

class PackCollectionViewCell: UICollectionViewCell, CellIdentifiable {
    @IBOutlet var packView: PackView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(withPack pack: PackDisplayModel) {
        packView.setup(pack: pack)
    }
}
