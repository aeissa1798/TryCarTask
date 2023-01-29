//
//  Target.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Alamofire

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Task {
    case requestPlain // without parameters
    case getWithParameters(parameters: [String: Any])
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetType {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

