//
//  ModuleTransitionable.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import UIKit

protocol ModuleTransitionable: AnyObject {
    func showModule(_ module: UIViewController)
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func push(module: UIViewController, animated: Bool)
    func setRoot(module: UIViewController, animated: Bool)
    func popToModule(typeOf: UIViewController.Type, animated: Bool)
    func dismissView(animated: Bool, completion: (() -> Void)?)
}

extension ModuleTransitionable where Self: UIViewController {
    
    func showModule(_ module: UIViewController) {
        self.show(module, sender: nil)
    }
    
    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.present(module, animated: animated, completion: completion)
    }
    
    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    
    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }
    
    func setRoot(module: UIViewController, animated: Bool) {
        self.navigationController?.setViewControllers([module], animated: true)
    }
    
    func popToModule(typeOf: UIViewController.Type, animated: Bool) {
        guard let vcons = self.navigationController?.viewControllers else { return }
        for vc in vcons {
            if vc.isKind(of: typeOf) {
                self.navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.dismiss(animated: animated, completion: completion)
    }
    
}
