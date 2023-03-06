//
//  ShoppingCartViewModel.swift
//  ShoppingApp
//
//  Created by Artun Erol on 5.03.2023.
//

import Foundation

typealias ProductCountPair = [Product : Int]

class ShoppingCartViewModel {
    var products: [Product] = []
    var productCountPairArray: [ProductCountPair] = []
    private var productsCount: Int = 0
    
    init() {
        products = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) ?? []
        getCountOfProduct()
    }
    
    private func getCountOfProduct() {
        for product in products {
            let productCountInCart = products.filter { $0.productName == product.productName }.count
            let productCountPair = [product : productCountInCart]
            
            if !productCountPairArray.contains(productCountPair) {
                productCountPairArray.append(productCountPair)
            }
        }
    }
}
