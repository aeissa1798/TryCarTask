//
//  ErrorModel.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

// MARK: - ErrorModel
struct ErrorModel: Codable {
    let status, code, message: String?
}
