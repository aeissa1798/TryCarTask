//
//  SelectedPostVCPresenter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

protocol SelectedPostView: AnyObject {
    var presenter: SelectedPostVCPresenter? { get set }
    func showLoader()
    func hideLoader()
    func updateFavIcon()
    func loadCommentsTable()
}

protocol SelectedPostCellView {
    func displayName(nameText: String)
    func displayEmail(emailText: String)
    func displayDetails(detailsText: String)
}

class SelectedPostVCPresenter {
    
    private weak var view: SelectedPostView?
    private var router: SelectedPostVCRouter
    private var interactor: SelectedPostAPI
    private var postId: Int
    private var postTitle: String
    private var commentsArray = [PostDetailsModelElement]()
    
    init(view: SelectedPostView?, router: SelectedPostVCRouter, interactor: SelectedPostAPI, postId: Int, postTitle: String) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.postId = postId
        self.postTitle = postTitle
    }
    //MARK: - func view did load
    func viewDidLoad() {
        getPostDetails()
    }
    //MARK: - func setup selectedPostCell
    func setupSelectedPostCell(cell: SelectedPostCell, for index: Int) {
        let commentsData = commentsArray[index]
        cell.displayName(nameText: commentsData.name ?? "")
        cell.displayEmail(emailText: commentsData.email ?? "")
        cell.displayDetails(detailsText: commentsData.body ?? "")
    }
    //MARK: - func get comments count
    func getCommentsCount() -> Int {
        return commentsArray.count
    }
    //MARK: - func go back
    func goBack() {
        router.goBack(from: view)
    }
    //MARK: - func add to favorites
    func addFavorites() {
        let favData = DataManager.shared.setFavorites(titleText: postTitle, id: postId)
        favoritesData.append(contentsOf: favData)
        DataManager.shared.save()
        view?.updateFavIcon()
    }
    //MARK: - func get post details
    func getPostDetails() {
        view?.showLoader()
        interactor.getPostDetails(id: postId) { [weak self] result, error, statusCode in
            guard let self else { return }
            self.view?.hideLoader()
            if let error = error {
                print("Error in get post details = \(error)")
            }else{
                guard result != nil else {
                    
                    return
                }
                self.commentsArray = result ?? []
                self.view?.loadCommentsTable()
            }
        }
    }
}
