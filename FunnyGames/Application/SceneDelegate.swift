//
//  SceneDelegate.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationVС = UINavigationController()
            switch LaunchInstructor.setupInitialPage() {
            case .registration:
                navigationVС.viewControllers = [LaunchInstructor.performRegistration()]
            case .game:
                navigationVС.viewControllers = [LaunchInstructor.performGame()]
            }
            window.rootViewController = navigationVС
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}

