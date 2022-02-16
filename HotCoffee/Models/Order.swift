//
//  Order.swift
//  HotCoffee
//
//  Created by Erluan Felix Batista on 16/02/22.
//

import Foundation

//enum CoffeeType: String, Codable {
//    case cappucino
//    case latte
//    case espressino
//    case cortado
//}

enum CoffeeSize: String, Codable {
    case Small
    case Medium
    case Large
}

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeeSize
    
}
