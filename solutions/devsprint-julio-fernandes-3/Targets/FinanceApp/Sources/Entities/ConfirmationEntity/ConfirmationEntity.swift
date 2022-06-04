//
//  ConfirmationEntity.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 03/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

enum ConfirmationViewStatus {
    case confirming
    case confirmed(ConfirmationEntity)
}

struct ConfirmationEntity {
    let success: Bool
    let imageName: String
    let message: String
}
