//
//  PostsVCInteractorAPI.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

protocol PostsAPIProtocol {
    func getPosts(completion: @escaping(PostsModel?, String?, Int?) -> Void)
}

class PostsAPI: BaseAPI<PostsNetwork>, PostsAPIProtocol {
    
    func getPosts(completion: @escaping (PostsModel?, String?, Int?) -> Void) {
        self.fetchData(target: .getPosts, responseClass: PostsModel.self) { data, error, statusCode in
            completion(data, error, statusCode)
        }
    }
    
}
