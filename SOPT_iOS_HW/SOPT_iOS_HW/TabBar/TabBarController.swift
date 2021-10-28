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

        let homeVC = HomeSB.instantiateViewController(identifier: "HomeVC")
        
        guard let secondVC = self.storyboard?.instantiateViewController(identifier:"SecondVC"),
              let thirdVC = self.storyboard?.instantiateViewController(identifier:"ThirdVC"),
              let fourthVC = self.storyboard?.instantiateViewController(identifier:"FourthVC"),
              let fifthVC = self.storyboard?.instantiateViewController(identifier:"FifthVC") else {return}
        
        UITabBar.appearance().tintColor = UIColor.black
      
        //MARK: - tabBarItem data
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        secondVC.tabBarItem.title = "shorts"
        secondVC.tabBarItem.image = UIImage(named: "shortsIcon")
        secondVC.tabBarItem.selectedImage = UIImage(named: "shortsIcon")
        thirdVC.tabBarItem.title = "추가"
        thirdVC.tabBarItem.image = UIImage(named: "plueCircleIcon")
        fourthVC.tabBarItem.title = "구독"
        fourthVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        fourthVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        fifthVC.tabBarItem.title = "보관함"
        fifthVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        fifthVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([homeVC, secondVC, thirdVC, fourthVC, fifthVC], animated: true)
    }
}
