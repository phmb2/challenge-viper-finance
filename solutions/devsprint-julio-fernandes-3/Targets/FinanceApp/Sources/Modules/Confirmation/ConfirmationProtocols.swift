//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 03/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

// MARK: ConfirmationPresenterProtocol
protocol ConfirmationPresenterProtocol {
    var view: ConfirmationPresenterDelegate? { get set }
    
    func viewDidLoad()
}

// MARK: ConfirmationPresenterDelegate
protocol ConfirmationPresenterDelegate: AnyObject {
    func showConfirmation(confirmation: ConfirmationEntity)
}

// MARK: ConfirmationInteractorProtocol
protocol ConfirmationInteractorProtocol {
    func fetchData()
}

// MARK: ConfirmationConfiguratorProtocol
protocol ConfirmationConfiguratorProtocol {
    static func createModule(confirmation: ConfirmationEntity) -> UIViewController
}
