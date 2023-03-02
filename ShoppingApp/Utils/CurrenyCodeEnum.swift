//
//  CurrenyCodeEnum.swift
//  ShoppingApp
//
//  Created by Artun Erol on 2.03.2023.
//

import Foundation

enum CurrenyCodeEnum {
    case tl
    
    func unitCode() -> String {
        switch self {
        case .tl:
            return "TL"
        }
    }
}
