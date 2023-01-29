//
//  SelectedPostVC+PresenterDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

extension SelectedPostVC: SelectedPostView {
    
    func showLoader() {
        startAnimate()
    }
    func hideLoader() {
        stopAnimate()
    }
    func loadCommentsTable() {
        setupTableView(tableView: commentsTable)
        commentsTable.reloadData()
    }
    func updateFavIcon() {
        favBtn.setImage(UIImage(named: "imgFavSelected"), for: .normal)
    }
}
