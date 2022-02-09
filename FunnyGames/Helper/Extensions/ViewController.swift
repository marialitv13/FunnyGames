//
//  ViewController.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

extension UIViewController {
    
    static func controllerFromStoryboard(_ storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass())
    }
    
    static func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    static func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func showAlert(alertTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: NSLocalizedString("AlertSubtitle", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
