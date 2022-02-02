//
//  AppDelegate.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let navigationVC = UINavigationController()
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
//        switch LaunchInstructor.setupInitialPage() {
//        case .registration:
//            navigationVC.viewControllers = [LaunchInstructor.performRegistration()]
//        default:
//            navigationVC.viewControllers = [LaunchInstructor.performRegistration()]
//        }
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        self.window?.rootViewController = initialViewController
//        self.window?.makeKeyAndVisible()
//
//        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
}

