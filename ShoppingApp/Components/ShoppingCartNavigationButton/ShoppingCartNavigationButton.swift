//
//  ShoppingCartNavigationButton.swift
//  ShoppingApp
//
//  Created by Artun Erol on 6.03.2023.
//

import UIKit

class ShoppingCartNavigationButton: UIButton {

    @IBOutlet var cartImageView: UIImageView! {
        didSet {
            let cartImage = UIImage(named: "cart")?.withRenderingMode(.alwaysTemplate)
            cartImageView.image = cartImage
            cartImageView.tintColor = .white
        }
    }
    
    @IBOutlet var countContainerView: UIView! {
        didSet {
            countContainerView.layer.cornerRadius = countContainerView.frame.height / 2
            countContainerView.backgroundColor = .red
            countContainerView.isHidden = true
        }
    }
    @IBOutlet var countLabel: UILabel! {
        didSet {
            countLabel.font = .appSmallFont
            countLabel.textColor = .white
            countLabel.contentMode = .scaleAspectFit
        }
    }
    
    func configureUI() {
        guard let productsInCart = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) else { return }
        
        countContainerView.isHidden = productsInCart.isEmpty
        countLabel.text = String(productsInCart.count)
    }
}
