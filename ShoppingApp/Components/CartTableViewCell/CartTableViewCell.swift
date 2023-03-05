//
//  CartTableViewCell.swift
//  ShoppingApp
//
//  Created by Artun Erol on 5.03.2023.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifier = "CartTableViewCell"
    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productCountLabel: UILabel!
    @IBOutlet var shadowContainer: UIView! {
        didSet {
            shadowContainer.layer.cornerRadius = 8
            shadowContainer.layer.shadowColor = UIColor.black.cgColor
            shadowContainer.layer.shadowOpacity = 0.5
            shadowContainer.layer.shadowRadius = 2
            shadowContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
            shadowContainer.layer.masksToBounds = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(product: Product, count: Int) {
        let productImageURLString = (product.productImage ?? "") + "?raw=true"
        let productImageURL = URL(string: productImageURLString)
        
        productImageView.image(from: productImageURL)
        productNameLabel.text = product.productName
        productCountLabel.text = String(count)
    }
}
