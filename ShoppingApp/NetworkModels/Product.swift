//
//  Product.swift
//  ShoppingApp
//
//  Created by Artun Erol on 2.03.2023.
//

import Foundation

typealias ProductList = [Product]

struct Product: Codable {
    let productName: String
    let productDescription: String
    let productPrice: Double
    let productImage: String
}
