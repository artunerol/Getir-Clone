//
//  ViewControllerBuilder.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

class ViewControllerBuilder {
    static func buildViewControllers() -> [UIViewController] {
        var vcArray: [UIViewController] = []
        
        for id in NavigationEnum.allCases {
            let vc = UIStoryboard(name: id.rawValue, bundle: nil).instantiateViewController(withIdentifier: id.rawValue)
            vcArray.append(vc)
        }
        return vcArray
    }
}
