//
//  SelectedPostVCInteractorNetwork.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Alamofire

enum SelectedPostNetwork {
    case postDetails(id: Int)
}

extension SelectedPostNetwork: TargetType {
    var base: String {
        switch self {
        default:
            return URLs.Base
        }
    }
    
    var path: String {
        switch self {
        case .postDetails(let id):
            return URLs.posts + "/\(id)/comments"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postDetails:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .postDetails(let id):
            return .getWithParameters(parameters: ["": id])
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postDetails:
            return [:]
        }
    }
}

