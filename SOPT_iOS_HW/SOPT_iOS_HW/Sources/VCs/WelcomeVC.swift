//
//  SecondViewController.swift
//  SecondViewController
//
//  Created by Junho Lee on 2021/10/07.
//

import UIKit

class WelcomeVC: UIViewController {

    //MARK: - IBoulets
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var OKButton: UIButton!
   
    //MARK: - vars / lets
    
    var message: String?
    var viewcontrollers : [UIViewController] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
        print(self.navigationController?.viewControllers.count as Any)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Custom Methods
    
    func setMessageInLabel(){
        let msg = UserDefaults.standard.string(forKey: "nameText")
        dataLabel.text = "\(String(describing: msg!))님\n환영합니다!"
        dataLabel.sizeToFit()
    }
    
    @IBAction func goToTabBarSB(_ sender: Any) {
        let secondStoryboard = UIStoryboard.init(name: "TabBarStoryboard", bundle:nil)

        guard let nextVC = secondStoryboard.instantiateViewController(identifier: "TabBarController") as? TabBarController else {return}

        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:true, completion:nil)
    }

    @IBAction func goBackToLogin(_ sender: Any) {
        guard let viewControllerStack = self.navigationController?.viewControllers else {return}
        for viewController in viewControllerStack {
            if let loginV = viewController as? LoginVC {
                self.navigationController?.popToViewController(loginV, animated: true)
            }
        }
    }
}
