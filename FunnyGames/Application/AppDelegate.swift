//
//  AppDelegate.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        setupNavigationBar()
        return true
    }
    
    private func setupNavigationBar() {
        UINavigationBar.appearance().tintColor = .white
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000, vertical: 0), for:UIBarMetrics.default)
    }
    
}

