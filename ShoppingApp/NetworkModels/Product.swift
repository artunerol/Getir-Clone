//
//  Product.swift
//  ShoppingApp
//
//  Created by Artun Erol on 2.03.2023.
//

import Foundation

typealias ProductList = [Product]

struct Product: Codable, Hashable {
    let productName: String?
    let productDescription: String?
    let productPrice: Double?
    let productImage: String?
    
    init(productName: String? = nil, productDescription: String? = nil, productPrice: Double? = nil, productImage: String? = nil) {
        self.productName = productName
        self.productDescription = productDescription
        self.productPrice = productPrice
        self.productImage = productImage
    }
}
