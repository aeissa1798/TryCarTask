//
//  FavoritesVCPresenter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

protocol FavoritesView: AnyObject {
    var presenter: FavoritesVCPresenter? { get set }
    func loadFavoritesTable()
}

 var favoritesData = [Favorites]()

class FavoritesVCPresenter {
    
    private weak var view: FavoritesView?
    private var router = FavoritesVCRouter()
    
    init(view: FavoritesView?) {
        self.view = view
    }
    //MARK: - func view didload
    func viewDidLoad() {
        favoritesData = DataManager.shared.fetchFavoritess()
        DataManager.shared.save()
        view?.loadFavoritesTable()
    }
    //MARK: - func setup home cell
    func setupFavoritesCell(cell: PostsCell, for index: Int) {
        cell.displayTitle(titleText: favoritesData[index].title ?? "")
    }
    //MARK: - func get articles count
    func getFavoritesCount() -> Int {
        return favoritesData.count
    }
    //MARK: - func did select article
    func didSelectFavorites(for index: Int) {
        router.navigateToSelectedPostVC(id: Int(favoritesData[index].id), postTitle: favoritesData[index].title ?? "", from: view)
    }
}
