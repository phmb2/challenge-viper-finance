//
//  ConfirmationConfigurator.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 03/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class ConfirmationConfigurator: ConfirmationConfiguratorProtocol {
    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        let view = ConfirmationViewController()
        let presenter = ConfirmationPresenter(confirmation: confirmation)
        
        view.presenter = presenter
        
        return view
    }
}
