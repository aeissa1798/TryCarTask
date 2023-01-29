//
//  TabBarPresenter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation

protocol TabBarView: AnyObject {
    var presenter: TabBarPresenter? { get set }
    func setupTabBar()
}

class TabBarPresenter {
    
    private weak var view: TabBarView?
    
    init(view: TabBarView?) {
        self.view = view
    }
    // MARK: - func viewDidLaod
    func viewdidLoad() {
        view?.setupTabBar()
    }
}
