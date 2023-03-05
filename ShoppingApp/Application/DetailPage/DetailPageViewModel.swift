//
//  DetailPageViewModel.swift
//  ShoppingApp
//
//  Created by Artun Erol on 3.03.2023.
//

import Foundation

class DetailPageViewModel: BaseViewModel {
    let productData: Product
    
    init(data: Product) {
        self.productData = data
    }
}
