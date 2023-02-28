//
//  NavigationRouter.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

class NavigationRouter {
    static func navigate(fromViewController: UIViewController,
                         destinationViewController: NavigationEnum,
                         transitionStlye: TransitionStyle) {
        
        let destinationVC = UIStoryboard(name: destinationViewController.rawValue, bundle: nil).instantiateViewController(withIdentifier: destinationViewController.rawValue)
        
        switch transitionStlye {
        case .modalFullScreen:
            destinationVC.modalPresentationStyle = .fullScreen
            fromViewController.present(destinationVC, animated: true)
        case .fullScreenWithNavigation:
            fromViewController.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}

// MARK: - TransitionStyle
enum TransitionStyle {
    case modalFullScreen
    case fullScreenWithNavigation
}
