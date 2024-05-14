//
//  SceneDelegate.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 05/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, 
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let navigation = UINavigationController(rootViewController: SummaryViewController())
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigation
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
    }

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

