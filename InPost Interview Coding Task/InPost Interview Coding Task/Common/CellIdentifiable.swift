//
//  CellIdentifiable.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import UIKit

protocol CellIdentifiable {
    static var identifier: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    static var identifier: String {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return className
    }
}

extension CellIdentifiable where Self: UICollectionViewCell {
    static var identifier: String {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return className
    }
}

