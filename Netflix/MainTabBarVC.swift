//
//  ViewController.swift
//  Netflix
//
//  Created by Apple on 22/09/23.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: UpcomingVC())
        let vc3 = UINavigationController(rootViewController: SearchVC())
        let vc4 = UINavigationController(rootViewController: DownloadsVC())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "square.and.arrow.down")
        
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Searches"
        vc4.title = "Downloads"
        
        //Code line to automatically change tabBar tint color based on DarkMode/LightMode (Command + Shift + A).
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
}

