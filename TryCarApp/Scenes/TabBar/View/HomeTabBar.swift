//
//  HomeTabBar.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class HomeTabBar: UITabBarController {
    
    var presenter: TabBarPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TabBarPresenter(view: self)
        presenter?.viewdidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
}
