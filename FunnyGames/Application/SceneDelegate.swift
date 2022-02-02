//
//  SceneDelegate.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let navigationVC = UINavigationController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        setupNavigationVC()
//        setupInitialPage()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
          let vc = storyboard.instantiateViewController (withIdentifier: "RegistrationViewController")
        self.window = UIWindow(frame: UIScreen.main.bounds)
//          window = UIWindow(windowScene: windowScene)
          window?.rootViewController = vc
          window?.makeKeyAndVisible()
        
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
//        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
    }
    
    private func setupNavigationVC() {
        navigationVC.isToolbarHidden = true
        navigationVC.isNavigationBarHidden = true
    }
    
//    private func setupInitialPage() {
//        switch LaunchInstructor.setupInitialPage() {
//        case .registration:
//            navigationVC.viewControllers = [LaunchInstructor.performRegistration()]
//        default:
//            navigationVC.viewControllers = [LaunchInstructor.performRegistration()]
//        }
//    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
}

