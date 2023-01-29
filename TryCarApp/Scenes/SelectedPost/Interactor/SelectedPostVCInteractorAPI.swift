//
//  SelectedPostVCInteractorAPI.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

protocol SelectedPostAPIProtocol {
    func getPostDetails(id: Int, completion: @escaping(PostDetailsModel?, String?, Int?) -> Void)
}

class SelectedPostAPI: BaseAPI<SelectedPostNetwork>, SelectedPostAPIProtocol {
    func getPostDetails(id: Int, completion: @escaping (PostDetailsModel?, String?, Int?) -> Void) {
        self.fetchData(target: .postDetails(id: id), responseClass: PostDetailsModel.self) { data, error, statusCode in
            completion(data, error, statusCode)
        }
    }
}
