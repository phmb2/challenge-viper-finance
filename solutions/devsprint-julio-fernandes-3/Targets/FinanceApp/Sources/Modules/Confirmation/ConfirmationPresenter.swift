//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 03/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class ConfirmationPresenter: ConfirmationPresenterProtocol {
    weak var view: ConfirmationPresenterDelegate?
    private var confirmation: ConfirmationEntity
    
    init(confirmation: ConfirmationEntity) {
        self.confirmation = confirmation
    }
    
    func viewDidLoad() {
        view?.showConfirmation(confirmation: confirmation)
    }
}
