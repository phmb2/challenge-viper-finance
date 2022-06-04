//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class TransfersRouter: TransfersRouterProtocol {
    var view: UIViewController?
    
    func navigateToContactListModule() {
        let viewController = ContactListConfigurator.createModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        view?.present(navigationController, animated: true)
    }
    
    func navigateToConfirmationModule(confirmation: ConfirmationEntity) {
        let viewController = ConfirmationConfigurator.createModule(confirmation: confirmation)
        let navigationController = UINavigationController(rootViewController: viewController)
        view?.present(navigationController, animated: true)
    }
}
