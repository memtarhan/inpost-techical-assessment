//
//  PacksViewController.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import UIKit

class PacksViewController: UIViewController, NibLoadable {
    var viewModel: PacksViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow

        viewModel.load()
    }
}
