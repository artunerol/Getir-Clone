//
//  ProductsCollectionCellViewModel.swift
//  ShoppingApp
//
//  Created by Artun Erol on 1.03.2023.
//

import Foundation

class ProductsCollectionCellViewModel {
    let imagePath: String?
    let productPrice: Int?
    let productName: String?
    
    init(imagePath: String?, productPrice: Int?, productName: String?) {
        self.imagePath = imagePath
        self.productPrice = productPrice
        self.productName = productName
    }
}
