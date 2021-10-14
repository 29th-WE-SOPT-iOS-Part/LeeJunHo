//
//  TabBarController.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/15.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let firstVC = self.storyboard?.instantiateViewController(identifier:"FirstVC"),
              let secondVC = self.storyboard?.instantiateViewController(identifier:"SecondVC"),
              let thirdVC = self.storyboard?.instantiateViewController(identifier:"ThirdVC"),
              let fourthVC = self.storyboard?.instantiateViewController(identifier:"FourthVC"),
              let fifthVC = self.storyboard?.instantiateViewController(identifier:"FifthVC") else {return}
        
        firstVC.tabBarItem.title = "홈"
        firstVC.tabBarItem.image = UIImage(named: "homeIcon")
        firstVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        secondVC.tabBarItem.title = "shorts"
        secondVC.tabBarItem.image = UIImage(named: "shortIcon")
        secondVC.tabBarItem.selectedImage = UIImage(named: "shortIcon")
        thirdVC.tabBarItem.title = "추가"
        thirdVC.tabBarItem.image = UIImage(named: "plueCircleIcon")
        fourthVC.tabBarItem.title = "구독"
        fourthVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        fourthVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        fifthVC.tabBarItem.title = "보관함"
        fifthVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        fifthVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC], animated: true)
              
    }

}
