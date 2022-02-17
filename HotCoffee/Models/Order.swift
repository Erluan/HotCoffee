//
//  Order.swift
//  HotCoffee
//
//  Created by Erluan Felix Batista on 16/02/22.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case Cappucino = "Cappucino"
    case Latte = "Latte"
    case Espressino = "Espressino"
    case Cortado = "Cortado"
}

enum CoffeeSize: String, Codable, CaseIterable {
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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string:  "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm : AddCoffeeViewModel) -> Resource<Order?>{
        
        let order = Order(vm)
        
        guard let url = URL(string:  "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
        
        
    }
    
}

extension Order {
    
    init?(_ vm: AddCoffeeViewModel) {
        
        guard let name = vm.name,
        let coffeeName = CoffeeType(rawValue: vm.selectedCoffeeName!),
        let selectedSize = CoffeeSize(rawValue: vm.selectedSize!),
        let total = Double(vm.total!) else {
          return nil
        }
        
        print(coffeeName)
        self.name = name
        self.coffeeName = "Latte"
        self.size = selectedSize
        self.total = total
        
    }
    
}
