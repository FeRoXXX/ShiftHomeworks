//
//  SceneDelegate.swift
//  HW4
//
//  Created by Александр Федоткин on 06.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: HomeViewController())
        navigationController.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationController
        self.window = window
    }
}

