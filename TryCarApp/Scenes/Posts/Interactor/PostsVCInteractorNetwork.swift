//
//  PostsVCInteractorNetwork.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Alamofire

enum PostsNetwork {
   case getPosts
}

extension PostsNetwork: TargetType {
    var base: String {
        switch self {
        default:
            return URLs.Base
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return URLs.posts
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPosts:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getPosts:
            return [:]
        }
    }
}
