//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Erluan Felix Batista on 12/02/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders(){
        
        guard let coffeeOrdersUrl = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersUrl)
        
        WebService().load(resource: resource){ result in
            
            switch result {
                case .success(let orders):
                    print(orders)
                case .failure(let error):
                    print(error)
            }
        }
    }
    

}
