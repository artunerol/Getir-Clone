//
//  UserdefaultsStore.swift
//  ShoppingApp
//
//  Created by Artun Erol on 4.03.2023.
//

import Foundation

class UserdefaultsStore {
    static func set<T: Codable>(value: T?, key: String) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(value)
            UserDefaults.standard.set(data, forKey: key)
        }
        
        catch {
            print("Can not encode custom value")
        }
    }
    
    static func get<T: Decodable>(type: T.Type, key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(type.self, from: data)
                return decodedData

            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return nil
    }
}

struct UserDefaultsKeys {
    static let productsInCart = "ProductsInCart"
}
