//
//  SceneDelegate.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: ListOfImageAssembly.build())
        self.window = window
    }
}

