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
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productPriceLabel: UILabel! {
        didSet {
            productPriceLabel.textColor = .appPurple
            productPriceLabel.font = UIFont.appRegularBoldFont
        }
    }
    
    @IBOutlet var productNameLabel: UILabel! {
        didSet {
            productNameLabel.textColor = .black
            productNameLabel.font = UIFont.appRegularFont
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with model: ProductsCollectionCellViewModel) {
        productImageView.image = UIImage(named: "logo")
        productPriceLabel.text = "215 TL"
        productNameLabel.text = model.productName
    }
}
