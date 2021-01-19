//
//  ChooseWorkerVC.swift
//  CarWash
//
//  Created by Himanshu Joshi on 17/01/21.
//

import UIKit

class ChooseWorkerVC: UIViewController {
    
    var carType: String?
    var waterWashBool: Bool?
    var innerVaccumBool: Bool?
    var shinerPolishBool: Bool?
    var carCompany: String?
    var carModelName: String?
    var carNumber: String?
    var date: String?
    var timeSlot: String?

    let topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 25.0)
        label.text = "Select Worker"
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30.0).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topLabel.bottomAnchor, constant: 20.0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }

}
