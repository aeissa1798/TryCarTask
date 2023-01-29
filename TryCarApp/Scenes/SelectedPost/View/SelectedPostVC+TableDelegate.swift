//
//  SelectedPostVC+TableDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

extension SelectedPostVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView(tableView : UITableView) {
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset  = .zero
        tableView.contentInset    = .zero
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator   = false
        tableView.registerCell(cell: SelectedPostCell.self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCommentsCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedPostCell", for: indexPath) as? SelectedPostCell else { return SelectedPostCell() }
        presenter?.setupSelectedPostCell(cell: cell, for: indexPath.row)
        return cell
    }
}
