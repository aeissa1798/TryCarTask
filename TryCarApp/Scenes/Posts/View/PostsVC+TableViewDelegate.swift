//
//  PostsVC+TableViewDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

extension PostsVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView(tableView : UITableView) {
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset  = .zero
        tableView.contentInset    = .zero
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator   = false
        tableView.registerCell(cell: PostsCell.self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPostsCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsCell", for: indexPath) as? PostsCell else { return PostsCell() }
        presenter?.setupPostsCell(cell: cell, for: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPosts(for: indexPath.row)
    }
}

