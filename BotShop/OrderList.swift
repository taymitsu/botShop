//
//  OrderList.swift
//  BotShop
//
//  Created by Tay Mitsumori on 5/10/22.
//

import Foundation
import UIKit

class OrderList: UIViewController {
    var currentOrder: Order?
    var orderItems: [Item] = []
//
//    let orders = [
//        Order(title: "July 2020", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "June 2020", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "May 2020", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "December 2019", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "November 2019", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "October 2019", image: UIImage(named: "box")!, items: <#[Item]#>),
//        Order(title: "September 2019", image: UIImage(named: "box")!, items: <#[Item]#>)
//    ]
    let tableView =  UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        tableView.register(PastOrderCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        setUpTableView()
    }

    func setUpTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

}

extension OrderList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let currentOrder = currentOrder{
            return currentOrder.items.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PastOrderCell
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
        
        if let currentOrder = currentOrder{
            cell.setCellContents(item: currentOrder.items[indexPath.row])
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}
