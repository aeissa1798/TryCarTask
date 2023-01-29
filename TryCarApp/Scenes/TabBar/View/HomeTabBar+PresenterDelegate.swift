//
//  HomeTabBar+PresenterDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

extension HomeTabBar: TabBarView {
    
    func setupTabBar() {
        if let tabBarItems = tabBar.items {
            for item in tabBarItems {
                guard let itemIndex = tabBarItems.firstIndex(of: item) else { return }
                switch (itemIndex) {
                case 0:
                    item.title = "Posts"
                case 1:
                    item.title = "Favorites"
                default: break
                }
            }
        }
    }
}
