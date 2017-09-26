//
//  SMSTMainTabbarViewController.swift
//  SmartStudent
//
//  Created by Somlea Felix-Bogdan on 9/26/17.
//  Copyright © 2017 Somlea Felix-Bogdan. All rights reserved.
//

import UIKit

class SMSTMainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.colorWith(red: 251, green: 191, blue: 96)], for: .selected)

        self.tabBar.tintColor = UIColor.colorWith(red: 251, green: 191, blue: 96)
        self.tabBar.barTintColor = UIColor.colorWith(red: 8, green: 140, blue: 156)

        let homeViewController = SMSTHomeViewController(nibName: "SMSTHomeViewController", bundle: nil)
        let homeNavigation = UINavigationController(rootViewController: homeViewController)

        homeNavigation.tabBarItem = UITabBarItem(title: "Acasa",
                                                 image: UIImage(named: "home_icon")?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage(named: "home_icon"))


        let applySmartCardScreen = SMSTApplySmartCardViewController(nibName: "SMSTApplySmartCardViewController", bundle: nil)
        let applyNavigation = UINavigationController(rootViewController: applySmartCardScreen)

        applyNavigation.tabBarItem = UITabBarItem(title: "Vreau SmartCard",
                                                  image: UIImage(named: "apply_icon")?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: UIImage(named: "apply_icon"))

        let notificationsViewController = SMSTNotificationsViewController(nibName: "SMSTNotificationsViewController", bundle: nil)
        let notificationsNavigation = UINavigationController(rootViewController: notificationsViewController)

        notificationsNavigation.tabBarItem = UITabBarItem(title: "Notificari",
                                                          image: UIImage(named: "notifications_icon")?.withRenderingMode(.alwaysOriginal),
                                                          selectedImage: UIImage(named: "notifications_icon"))

        let moreViewController = SMSTMoreViewController(nibName: "SMSTMoreViewController", bundle: nil)
        let moreNavigation = UINavigationController(rootViewController: moreViewController)

        moreNavigation.tabBarItem = UITabBarItem(title: "Mai Multe",
                                                 image: UIImage(named: "more_icon")?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage(named: "more_icon"))


        let viewControllers = [homeNavigation, applyNavigation, notificationsNavigation, moreNavigation]
        self.viewControllers = viewControllers

        // Do any additional setup after loading the view.
    }



}
