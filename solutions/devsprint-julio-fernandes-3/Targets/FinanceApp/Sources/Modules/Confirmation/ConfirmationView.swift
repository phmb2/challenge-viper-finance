//
//  ConfirmationView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ConfirmationViewDelegate: AnyObject {
    func onTapConfirmation()
}

class ConfirmationView: UIView {
    
    weak var delegate: ConfirmationViewDelegate?
    
    var status: ConfirmationViewStatus = .confirming {
        didSet {
            setupConfirmationView()
        }
    }

    private(set) lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()

    private(set) lazy var confirmationImageView: UIImageView = {

        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.tintColor = .systemGreen
        return imageView
    }()

    private(set) lazy var confirmationLabel: UILabel = {

        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var confirmationButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nice!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(onTapConfirmationButton), for: .touchUpInside)
        return button
    }()
    
    private(set) lazy var loadingView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView(style: .medium)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()

    init(status: ConfirmationViewStatus) {
        super.init(frame: .zero)

        backgroundColor = .white

        stackView.addArrangedSubview(confirmationImageView)
        stackView.addArrangedSubview(confirmationLabel)

        addSubview(stackView)
        addSubview(confirmationButton)
        addSubview(loadingView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            confirmationImageView.heightAnchor.constraint(equalToConstant: 100),
            confirmationImageView.widthAnchor.constraint(equalToConstant: 100),

            confirmationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            confirmationButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            confirmationButton.heightAnchor.constraint(equalToConstant: 56),
            
            loadingView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        setupConfirmationView()
    }

    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupConfirmationView() {
        switch self.status {
        case .confirmed(let confirmation):
            loadingView.stopAnimating()
            loadingView.isHidden = true
            stackView.isHidden = false

            confirmationImageView.image = UIImage(named: confirmation.imageName)
            confirmationImageView.tintColor = confirmation.success ? UIColor.green : UIColor.red
            confirmationLabel.text = confirmation.message

        case .confirming:
            loadingView.startAnimating()
            loadingView.isHidden = false
            stackView.isHidden = true
        }
    }
    
    @objc func onTapConfirmationButton() {
        delegate?.onTapConfirmation()
    }
}
