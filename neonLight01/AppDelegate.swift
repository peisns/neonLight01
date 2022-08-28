//
//  AppDelegate.swift
//  neonLight01
//
//  Created by Brother Model on 2022/07/06.
//

import UIKit

import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // melon, youtube 사용자 프리미엄 결제했으면 play, 일시정지
        // 금융앱은 화면에 다른 이미지 씌움
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        // youtube - 결제 안한 사람들에게 팝업창을 띄워!
        // 카카오톡 - 비밀번호 띄워
    }
    
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

