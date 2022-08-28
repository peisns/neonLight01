//
//  SceneDelegate.swift
//  neonLight01
//
//  Created by Brother Model on 2022/07/06.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let calendarVC = CalendarViewController()
        let diaryVC = UINavigationController(rootViewController: DiaryViewController())
        let dataVC = DataViewController()
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([calendarVC, diaryVC, dataVC], animated: true)
        
        if let items = tabBarController.tabBar.items {
            items[0].title = "Calendar"
            items[0].image = UIImage(systemName: "calendar.circle")
            items[0].selectedImage = UIImage(systemName: "calendar.circle.fill")
            
            items[1].title = "Diary"
            items[1].image = UIImage(systemName: "pencil.circle")
            items[1].selectedImage = UIImage(systemName: "pencil.circle.fill")
            
            items[2].title = "Data"
            items[2].image = UIImage(systemName: "square.and.arrow.down.on.square")
            items[2].selectedImage = UIImage(systemName: "square.and.arrow.down.on.square.fill")
        }

        // appearance code
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.stackedLayoutAppearance.normal.iconColor = .systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = .black
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance

        //tabBar Top border
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:tabBarController.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.systemGray
        tabBarController.tabBar.addSubview(lineView)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

