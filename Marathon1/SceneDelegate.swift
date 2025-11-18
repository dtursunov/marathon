//
//  SceneDelegate.swift
//  Marathon1
//
//  Created by Diyor Tursunov on 02/11/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        let navigationController = UINavigationController(rootViewController: AwesomeAssembly.assemble())
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
    }
}

