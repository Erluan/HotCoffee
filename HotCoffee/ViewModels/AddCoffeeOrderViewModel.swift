//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Erluan Felix Batista on 16/02/22.
//

import Foundation

struct AddCoffeeViewModel {
    
    var name: String?
    var coffeeName: String?
    var total: String?
    
    var selectedCoffeeName: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
}
