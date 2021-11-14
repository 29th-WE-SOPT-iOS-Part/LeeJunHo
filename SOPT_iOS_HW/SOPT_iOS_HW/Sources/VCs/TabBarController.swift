//
//  TabBarController.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/15.
//

import UIKit

class TabBarController: UITabBarController {

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    //MARK: - Basic Setup
    
    func setTabBar() {
        let HomeSB = UIStoryboard.init(name: "HomeStoryboard", bundle:nil)
        let homeNVC = HomeSB.instantiateViewController(identifier: "HomeNVC")
        
        guard let shortsVC = self.storyboard?.instantiateViewController(identifier:"ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(identifier:"AddVC"),
              let subscVC = self.storyboard?.instantiateViewController(identifier:"SubscVC"),
              let libraryVC = self.storyboard?.instantiateViewController(identifier:"LibraryVC") else {return}
        
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
      
        //MARK: - tabBarItem data
        
        homeNVC.tabBarItem = UITabBarItem(title : "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        shortsVC.tabBarItem = UITabBarItem(title : "shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIcon"))
        addVC.tabBarItem = UITabBarItem(title : "추가", image: UIImage(named: "plueCircleIcon"), selectedImage: UIImage(named: "plueCircleIcon"))
        subscVC.tabBarItem = UITabBarItem(title : "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        libraryVC.tabBarItem = UITabBarItem(title : "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconIconFill"))
        
        setViewControllers([homeNVC, shortsVC, addVC, subscVC, libraryVC], animated: true)
    }
}
