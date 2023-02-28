//
//  UIViewController+LoadNib.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}

