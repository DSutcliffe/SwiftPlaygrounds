//
//  PlaygroundViewController.swift
//  CoopComponents
//
//  Created by Alex Núñez on 10/07/2020.
//  Copyright © 2020 Mayur. All rights reserved.
//

import UIKit
import CoopUI

public class PlaygroundViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFromAccount()
        setupToAccount()
        setupAmount()
        setupReference()
    }

    func setupFromAccount() {
        
        let paymentsView = PaymentsView(
            headerLabel: "From",
            detailsLabel: "Online Saver",
            availableBalance: "£300.50",
            sortCodeAccountNumberLabel: "30-00-94  65548779",
            overdraftLimitLabel: "£100 overdraft limit",
            frame: CGRect.zero)
        
//        paymentsView.backgroundColor = .red
        view.addSubview(paymentsView)
        
        paymentsView.translatesAutoresizingMaskIntoConstraints = false
        paymentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        paymentsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        paymentsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -13).isActive = true
     
    }
    
    func setupToAccount() {
        
        let paymentsView = PaymentsView(
            headerLabel: "To",
            detailsLabel: "Alexandra Priestley",
            availableBalance: "",
            sortCodeAccountNumberLabel: "30-00-94 65548779",
            overdraftLimitLabel: "",
            frame: CGRect.zero)
        
//        paymentsView.backgroundColor = .red
        view.addSubview(paymentsView)
        
        paymentsView.translatesAutoresizingMaskIntoConstraints = false
        paymentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        paymentsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        paymentsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -13).isActive = true
        
    }
    
    func setupAmount() {
        
        let paymentsView = PaymentsView(
            headerLabel: "Amount",
            detailsLabel: "£10.00",
            availableBalance: "",
            sortCodeAccountNumberLabel: "",
            overdraftLimitLabel: "",
            frame: CGRect.zero)
        
//        paymentsView.backgroundColor = .red
        view.addSubview(paymentsView)
        
        paymentsView.translatesAutoresizingMaskIntoConstraints = false
        paymentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400).isActive = true
        paymentsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        paymentsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -13).isActive = true
        
    }
    
    func setupReference() {
        
        let paymentsView = PaymentsView(
           headerLabel: "Reference",
            detailsLabel: "An eighteen charac",
            availableBalance: "",
            sortCodeAccountNumberLabel: "",
            overdraftLimitLabel: "",
            frame: CGRect.zero)
        
//        paymentsView.backgroundColor = .red
        view.addSubview(paymentsView)
        
        paymentsView.translatesAutoresizingMaskIntoConstraints = false
        paymentsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500).isActive = true
        paymentsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 13).isActive = true
        paymentsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -13).isActive = true
        
    }
    
}
