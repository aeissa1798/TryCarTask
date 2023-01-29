//
//  FavoritesVC+PresenterDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

extension FavoritesVC: FavoritesView {
    
    func loadFavoritesTable() {
        setupTableView(tableView: self.favoritesTableView)
        favoritesTableView.reloadData()
    }
}
