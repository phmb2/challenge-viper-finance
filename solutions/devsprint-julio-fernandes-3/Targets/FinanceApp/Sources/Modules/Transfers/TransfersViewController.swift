//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
    var presenter: TransfersPresenterProtocol?
    private(set) var transferAmount: String = ""

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: TransferViewDelegate
extension TransfersViewController: TransferViewDelegate {
    func setTransferAmount(value: String) {
        transferAmount = value
    }

    func didPressChooseContactButton() {
        presenter?.openContactList()
    }

    func didPressTransferButton() {
        presenter?.onTapTransfer(value: transferAmount)
    }
}

// MARK: TransfersPresenterDelegate
extension TransfersViewController: TransfersPresenterDelegate {
    func showData(transfer: TransfersEntity) {
        let imageName = transfer.success ? "checkmark.circle.fill" : "x.circle.fill"
        let message = transfer.success ? "Transfer was sent successfully!" : "Something went wrong!"
        let confirmation = ConfirmationEntity(success: true, imageName: imageName, message: message)
        presenter?.openTransferConfirmation(confirmation: confirmation)
    }
}
