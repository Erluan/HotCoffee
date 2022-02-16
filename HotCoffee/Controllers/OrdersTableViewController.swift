//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Erluan Felix Batista on 12/02/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
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
                    self.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.coffeeName
        cell.detailTextLabel?.text = vm.size
        
        return cell
        
    }
    

}
