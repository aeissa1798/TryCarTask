//
//  PostsVCPresenter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Reachability

protocol PostsView: AnyObject {
    var presenter: PostsVCPresenter? { get set }
    func showLoader()
    func hideLoader()
    func loadPostsTable()
}

protocol PostsCellView {
    func displayTitle(titleText: String)
}

class PostsVCPresenter {
    
    private weak var view: PostsView?
    private var router = PostsVCRouter()
    private var interactor = PostsAPI()
    private var postsArray = [Posts]()
    private var postsData = [PostsData]()
    
    init(view: PostsView?) {
        self.view = view
    }
    //MARK: - func setup home cell
    func setupPostsCell(cell: PostsCell, for index: Int) {
        cell.displayTitle(titleText: postsArray[index].postTitle ?? "")
    }
    //MARK: - func get articles count
    func getPostsCount() -> Int {
        return postsArray.count
    }
    //MARK: - func did select article
    func didSelectPosts(for index: Int) {
        let postData = postsArray[index]
        router.navigateToSelectedPostVC(id: Int(postData.postId), postTitle: postData.postTitle ?? "", from: view)
    }
    //MARK: - func get posts
    func getPostsFromDB() {
        postsArray = DataManager.shared.fetchPosts()
        DataManager.shared.save()
        view?.loadPostsTable()
    }
    func getPostsFromServer() {
        view?.showLoader()
        self.postsArray.removeAll()
        interactor.getPosts { [weak self] result, error, statusCode in
            guard let self else { return }
            self.view?.hideLoader()
            if let error = error {
                print("Error in get posts = \(error)")
            }else{
                guard result != nil else {
                    return
                }
                DataManager.shared.deletePosts()
                for a in result ?? [] {
                    let postTitle = DataManager.shared.setPostTitle(titleText: a.title ?? "", id: a.id ?? 0)
                    self.postsArray.append(contentsOf: postTitle)
                    DataManager.shared.save()
                }
                self.view?.loadPostsTable()
            }
        }
    }
}

