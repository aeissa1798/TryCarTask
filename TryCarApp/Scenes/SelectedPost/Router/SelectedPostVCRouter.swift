//
//  SelectedPostVCRouter.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

class SelectedPostVCRouter {
    
    class func createSelectedPostVC(id: Int, postTitle: String) -> UIViewController {
        let selectedPostVC = Storyboard.Main.instantiate(SelectedPostVC.self)
        if let selectedPostView = selectedPostVC as? SelectedPostView {
            let router = SelectedPostVCRouter()
            let interactor = SelectedPostAPI()
            let presenter = SelectedPostVCPresenter(view: selectedPostView, router: router, interactor: interactor, postId: id, postTitle: postTitle)
            selectedPostView.presenter = presenter
        }
        return selectedPostVC
    }
    // MARK: - func go back
    func goBack(from view: SelectedPostView?) {
        if let vc = view as? UIViewController {
            vc.navigationController?.popViewController(animated: true)
        }
    }
}
