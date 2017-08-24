//
//  AppDelegate.swift
//  demo
//
//  Created by ispl Mac Mini on 8/23/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let setting : UIUserNotificationSettings = UIUserNotificationSettings(types: .sound, categories: nil)
        UIApplication.shared.registerUserNotificationSettings(setting)
        UIApplication.shared.registerForRemoteNotifications()
        
        
        application.registerForRemoteNotifications()
        
        if(!UserDefaults.standard.bool(forKey: "isFtime"))
        {
            UserDefaults.standard.set(true, forKey: "isFtime")
            
            UserDefaults.standard.set(false, forKey: "Login")
            UserDefaults.standard.synchronize()
        }
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if(!UserDefaults.standard.bool(forKey: "isFtime"))
            {
                let rootController = storyboard.instantiateInitialViewController()
                self.window?.rootViewController = rootController
                self.window?.makeKeyAndVisible()
            }
            else
            {
                let rootController = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
                self.window?.rootViewController = rootController
                self.window?.makeKeyAndVisible()
            }
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let rootController = storyboard.instantiateInitialViewController()
//            self.window?.rootViewController = rootController
//            self.window?.makeKeyAndVisible()
            
            if(!UserDefaults.standard.bool(forKey: "Login"))
            {
                let rootController = storyboard.instantiateInitialViewController()
                self.window?.rootViewController = rootController
                self.window?.makeKeyAndVisible()
            }
            else
            {
                let rootController = storyboard.instantiateViewController(withIdentifier: "HomeScreen")
                self.window?.rootViewController = rootController
                self.window?.makeKeyAndVisible()
            }
        }
        
        
        
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //print("APNs token retrieved: \(deviceToken)")
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

