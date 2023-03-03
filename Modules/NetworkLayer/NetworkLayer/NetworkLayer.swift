//
//  NetworkLayer.swift
//  NetworkLayer
//
//  Created by Artun Erol on 2.03.2023.
//

import Foundation

public class NetworkLayer {
    
    public init() { /* Empty init */}
    
    public func request<T: Codable>(with url: URL, model: T.Type, completion: @escaping (T) -> Void) {
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            guard let data = data else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(model.self, from: data)
                completion(decodedResponse)
            } catch {
                print("Cant't decode with error \(error.localizedDescription)")
            }
            
        }.resume()
    }
}
