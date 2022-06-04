//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var presenter: ConfirmationPresenterProtocol?
    private(set) var confirmationView: ConfirmationView = ConfirmationView(status: .confirming)

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = self.confirmationView
    }
}

extension ConfirmationViewController: ConfirmationPresenterDelegate {
    func showConfirmation(confirmation: ConfirmationEntity) {
        confirmationView.status = .confirmed(confirmation)
    }
}
