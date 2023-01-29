//
//  PostsVC.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit
import Reachability

class PostsVC: UIViewController {

    //...IBOutlets...
    @IBOutlet weak var postsTableView: UITableView!
    
    let reachability = try! Reachability()
    var presenter: PostsVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PostsVCPresenter(view: self)
        checkNetworkStatus()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
