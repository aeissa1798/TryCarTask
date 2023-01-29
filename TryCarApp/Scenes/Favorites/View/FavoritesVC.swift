//
//  FavoritesVC.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class FavoritesVC: UIViewController {

    //...IBOutlets...
    @IBOutlet weak var favoritesTableView: UITableView!
    
    var presenter: FavoritesVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FavoritesVCPresenter(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
}
