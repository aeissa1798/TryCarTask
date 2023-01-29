//
//  PostsVC+PresenterDelegate.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import Foundation
import Reachability

extension PostsVC: PostsView {
    
    func showLoader() {
        startAnimate()
    }
    func hideLoader() {
        stopAnimate()
    }
    func loadPostsTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.setupTableView(tableView: self.postsTableView)
            self.postsTableView.reloadData()
        }
    }
}

extension PostsVC {
    // MARK: - func of check network status
    func checkNetworkStatus() {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            }else{
                print("Reachable via Cellular")
                // try reachability.startNotifier()
            }
        }
        reachability.whenUnreachable = { _ in
            print("Wifi is fail")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleRechability(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    // MARK: - func of check network
    @objc func handleRechability(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:        //...turn on wifi
            print("WIFI")
            presenter?.getPostsFromServer()
        case .cellular:    //...turn on ur phone data
            print("Cellular")
            presenter?.getPostsFromServer()
        case .unavailable:  //... turn off wifi
            print("no connection")
            presenter?.getPostsFromDB()
        case .none:        //... turn off wifi
            print("no connection")
            presenter?.getPostsFromDB()
        }
    }
}
