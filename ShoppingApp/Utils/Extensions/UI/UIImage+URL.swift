//
//  UIImage+URL.swift
//  ShoppingApp
//
//  Created by Artun Erol on 2.03.2023.
//

import UIKit

extension UIImageView {
    func image(from url: URL?){
        guard let url = url else { return }
        
        let _ = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
