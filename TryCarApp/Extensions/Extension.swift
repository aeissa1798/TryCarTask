//
//  Extension.swift
//  TryCarApp
//
//  Created by Eissa on 28/01/2023.
//

import UIKit
import JGProgressHUD
import Reachability

class Extensions: NSObject {

}

// MARK: - create hud
let hud: JGProgressHUD = {
    let hud = JGProgressHUD(style: .dark)
    hud.interactionType = .blockAllTouches
    return hud
}()

extension UIViewController  {
    
    
    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    @objc func dismissKeyboard() {
      //  KeyboardAvoiding.avoidingView = view
        view.endEditing(true)
    }
    func startAnimate() {
        hud.show(in: view)
    }
    func stopAnimate() {
        hud.dismiss(animated: true)
    }
    
}
