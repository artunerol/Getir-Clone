//
//  UIView+LoadNib.swift
//  ShoppingApp
//
//  Created by Artun Erol on 4.03.2023.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
