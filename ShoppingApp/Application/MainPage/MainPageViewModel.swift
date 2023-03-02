//
//  MainPageViewModel.swift
//  ShoppingApp
//
//  Created by Artun Erol on 2.03.2023.
//

import Foundation
import NetworkLayer

class MainPageViewModel {
    private let network = NetworkLayer()
    private let urlString = "https://mocki.io/v1/6bb59bbc-e757-4e71-9267-2fee84658ff2"
    
    var productListArray: [Product] = []
    
    func fetchProductListArray(completion: @escaping ([Product]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        network.request(with: url, model: [Product].self, completion: completion)
    }
}
