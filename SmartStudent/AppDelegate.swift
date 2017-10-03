//
//  AppDelegate.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        var infoComponents: [String] = []
        infoComponents.append("Name: \(Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") ?? "")")
        infoComponents.append("Bundle Id: \(Bundle.main.bundleIdentifier ?? "")")
        infoComponents.append("App version: \(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "") (\(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") ?? ""))")
        infoComponents.append("")
        if TARGET_OS_SIMULATOR != 0 {
            infoComponents.append("Bundle path: \(Bundle.main.bundleURL.absoluteString.replacingOccurrences(of: "file:///", with: "/"))")
            infoComponents.append("Documents path: \(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? "")")
        } else {
            infoComponents.append("Device Name: \(UIDevice.current.name)")
            infoComponents.append("Device Model: \(UIDevice.current.model)")
            infoComponents.append("System Version: \(UIDevice.current.systemVersion)")
        }
        print("Application did finish launching \n\n\t\(infoComponents.joined(separator: "\n\t"))")

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = SMSTMainTabbarViewController()
        self.window?.makeKeyAndVisible()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.colorWith(red: 8, green: 140, blue: 156)

        return true
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

