//
//  SelectedPostVC.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class SelectedPostVC: UIViewController {

    //...IBOutlets...
    @IBOutlet weak var commentsTable: UITableView!
    @IBOutlet weak var favBtn: UIButton!
    
    var presenter: SelectedPostVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    @IBAction func backTapped(_ sender: Any) {
        presenter?.goBack()
    }
    @IBAction func favTapped(_ sender: Any) {
        presenter?.addFavorites()
    }
}
