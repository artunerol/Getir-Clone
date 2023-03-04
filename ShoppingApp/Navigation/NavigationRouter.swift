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
                         destinationViewModel: BaseViewModel? = nil,
                         transitionStlye: TransitionStyle) {
        guard let destinationVC = UIStoryboard(name: destinationViewController.rawValue, bundle: nil).instantiateViewController(withIdentifier: destinationViewController.rawValue) as? BaseViewController else { return }
        
        destinationVC.dataSource = destinationVC as? ViewControllerDataSource
        destinationVC.dataSource?.data(with: destinationViewModel)
        
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
