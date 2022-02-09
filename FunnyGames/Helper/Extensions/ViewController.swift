//
//  ViewController.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

extension UIViewController {
    
    static func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    static func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass())
    }
    
    static func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass())
    }
    
}

extension UIViewController {
    
    static func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
}

extension UIViewController {

    func showAlert(alertTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: NSLocalizedString("AlertSubtitle", comment: ""), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
