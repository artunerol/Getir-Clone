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
        products.map { product in
            let productCount = products.filter { $0.productName == product.productName }.count
            let productCountPair = [product : productCount]
            
            if !productCountPairArray.contains(productCountPair) {
                productCountPairArray.append(productCountPair)
            }
        }
    }
    
    private func makeProductsUnique() {
        let uniqueProducts = Set(UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart) ?? [])
        products = Array(uniqueProducts)
    }
}
