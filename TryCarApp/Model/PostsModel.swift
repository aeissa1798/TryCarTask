//
//  PostsModel.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

// MARK: - PostsModelElement
struct PostsModelElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostsModel = [PostsModelElement]

struct PostsData {
    var title: String?
    var id: Int?
}
