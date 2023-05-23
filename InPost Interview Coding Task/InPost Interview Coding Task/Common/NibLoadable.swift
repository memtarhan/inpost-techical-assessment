//
//  NibLoadable.swift
//  InPost Interview Coding Task
//
//  Created by Mehmet Tarhan on 23/05/2023.
//

import UIKit

protocol NibLoadable {
    /// Instantiates a view controller from a nib with the same name
    static func instantiate() -> Self
}

extension NibLoadable where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]

        return Self(nibName: className, bundle: nil)
    }
}
