//
//  ProductDetailView.swift
//  ShoppingApp
//
//  Created by Artun Erol on 4.03.2023.
//

import UIKit

protocol ProductDetailViewDelegate: AnyObject {
    func cartUpdated()
}

class ProductDetailView: UIView {
    var delegate: ProductDetailViewDelegate?
    
    private var product: Product?
    private var productCountValue: Int = 0
    private var productCountInCart: Int = 0
    
    
    @IBOutlet var imageContainer: UIView! {
        didSet {
            imageContainer.layer.cornerRadius = 8
            imageContainer.layer.shadowColor = UIColor.black.cgColor
            imageContainer.layer.shadowOpacity = 0.5
            imageContainer.layer.shadowRadius = 2
            imageContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
            imageContainer.layer.masksToBounds = false
        }
    }
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel! {
        didSet {
            productName.font = .appHeaderBold
        }
    }
    
    @IBOutlet var productDescription: UILabel! {
        didSet {
            productDescription.font = .appRegularBigFont
        }
    }
    
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var productCountLabel: UILabel!
    
    @IBOutlet var updateCartButton: UIButton! {
        didSet {
            updateCartButton.layer.cornerRadius = 8
            updateCartButton.layer.masksToBounds = true
            updateCartButton.clipsToBounds = true
        }
    }
    
    @IBAction func updateCartButtonPressed(_ sender: Any) {
        var emptyProductsCart: [Product] = []
        
        if productCountValue > 0 {
            if var productsInCart = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) {
                
                productsInCart.removeAll(where: {$0 == product})
                for _ in 1...productCountValue {
                    productsInCart.append(product ?? Product())
                }
                UserdefaultsStore.set(value: productsInCart, key: UserDefaultsKeys.productsInCart)
            } else {
                for _ in 1...productCountValue {
                    emptyProductsCart.append(product ?? Product())
                    UserdefaultsStore.set(value: emptyProductsCart, key: UserDefaultsKeys.productsInCart)
                }
            }
        } else {
            if var productsInCart = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) {
                productsInCart.removeAll(where: {$0 == product})
                UserdefaultsStore.set(value: productsInCart, key: UserDefaultsKeys.productsInCart)
            }
        }
        
        delegate?.cartUpdated()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        productCountLabel.text = stepper.value.toIntToString()
        productCountValue = Int(stepper.value)
    }
}


// MARK: - Helpers

extension ProductDetailView {
    func configureView(product: Product) {
        self.product = product
        let productImageURLString = (product.productImage ?? "") + "?raw=true"
        let productImageURL = URL(string: productImageURLString)
        
        productImage.image(from: productImageURL)
        productName.text = product.productName
        productDescription.text = product.productDescription
        
        if isProductInCart(product: product) {
            updateCartButton.setTitle("Update Cart", for: .normal)
        } else {
            updateCartButton.setTitle("Add to Cart", for: .normal)
        }
        
        stepper.value = Double(productCountInCart)
        productCountLabel.text = String(productCountInCart)
    }
    
    private func isProductInCart(product: Product) -> Bool {
        guard let productArray = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) else { return false }
        productCountInCart = productArray.filter({$0.productName == product.productName}).count
        
        if productArray.contains(where: { $0.productName == product.productName }) {
            return true
        } else {
            return false
        }
    }
}
