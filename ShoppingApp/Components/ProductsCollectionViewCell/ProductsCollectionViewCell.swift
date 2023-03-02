//
//  ProductsCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Artun Erol on 1.03.2023.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "ProductsCollectionViewCell"

    @IBOutlet var shadowContainer: UIView! {
        didSet {
            shadowContainer.layer.cornerRadius = 8
            shadowContainer.layer.shadowColor = UIColor.black.cgColor
            shadowContainer.layer.shadowOpacity = 0.1
            shadowContainer.layer.shadowRadius = 2
            shadowContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
            shadowContainer.layer.masksToBounds = false
        }
    }
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var productImageView: UIImageView! {
        didSet {
            productImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet var productPriceLabel: UILabel! {
        didSet {
            productPriceLabel.textColor = .appPurple
            productPriceLabel.font = UIFont.appRegularBoldFont
        }
    }
    
    @IBOutlet var productNameLabel: UILabel! {
        didSet {
            productNameLabel.contentMode = .top
            productNameLabel.textColor = .black
            productNameLabel.font = UIFont.appRegularFont
        }
    }
    
    func configureCell(with model: Product) {
        let imageURLString = model.productImage + "?raw=true"
        let imageURL = URL(string: imageURLString)
        
        productImageView.image(from: imageURL)
        productPriceLabel.text = "\(model.productPrice.toString()) \(CurrenyCodeEnum.tl.unitCode())"
        productNameLabel.text = model.productName
    }
}
