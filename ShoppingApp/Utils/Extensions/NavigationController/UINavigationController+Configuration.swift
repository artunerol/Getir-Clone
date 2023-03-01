//
//  UINavigationController+Configuration.swift
//  ShoppingApp
//
//  Created by Artun Erol on 1.03.2023.
//

import UIKit

extension UINavigationController {
    
    func setViewControllers() {
        let viewControllersArray = ViewControllerBuilder.buildViewControllers()
        viewControllers = viewControllersArray
        popToRootViewController(animated: false)
    }
}
