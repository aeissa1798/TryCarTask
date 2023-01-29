//
//  PostDetailsModel.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

// MARK: - PostDetailsModelElement
struct PostDetailsModelElement: Codable {
    let postID, id: Int?
    let name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias PostDetailsModel = [PostDetailsModelElement]
