//
//  Storyboard.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit

public enum Storyboard: String {
    //storyBoards in APP
    case Splash
    case Main
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        var detectLang: String!
        detectLang = "Base"
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        let path = Bundle.main.path(forResource: detectLang , ofType: "lproj")
        let bundd = Bundle.init(path: path!)
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: bundd)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
        else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        return vc
        
    }
}
