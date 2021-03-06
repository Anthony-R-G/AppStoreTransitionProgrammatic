//
//  NavigationController.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension NavigationController: UINavigationControllerDelegate {
    func navigationController(
    _ navigationController: UINavigationController,
    animationControllerFor operation: UINavigationController.Operation,
    from fromVC: UIViewController,
    to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransitionAnimation(operation: operation, positioningDuration: 1, resizingDuration: 0.5)
    }
}
