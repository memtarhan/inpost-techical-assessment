//
//  ViewController.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

class PackListControllerX: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lista przesyłek"
        
        
    }
    
//    private func loadPacks() {
//        packNetworking.getPacks { result in
//            self.removePacks()
//
//            if case .success(let packs) = result {
//                packs.forEach { pack in
//                    self.addPackView(pack)
//                }
//            }
//        }
//    }
//
//    private func removePacks() {
//        stackView.arrangedSubviews.forEach { subview in
//            subview.removeFromSuperview()
//        }
//    }
//
//    private func addPackView(_ pack: Pack) {
//        let packView = PackView()
//        packView.setup(pack: pack)
//        stackView.addArrangedSubview(packView)
//    }

}
