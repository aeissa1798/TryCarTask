//
//  FavoritesVCRouter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class FavoritesVCRouter {
    
    // MARK: - func navigate to SelectedPostC
    func navigateToSelectedPostVC(id: Int, postTitle: String, from view: FavoritesView?) {
        let selectedPostView = SelectedPostVCRouter.createSelectedPostVC(id: id, postTitle: postTitle)
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(selectedPostView, animated: true)
        }
    }
}
