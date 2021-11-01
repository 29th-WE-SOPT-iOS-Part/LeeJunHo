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
    }
    
    //MARK: - Custom Methods
    
    func setMessageInLabel(){
        if let msg = message{
            dataLabel.text = "\(msg)님\n환영합니다!"
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func goToTabBarSB(_ sender: Any) {
        let secondStoryboard = UIStoryboard.init(name: "TabBarStoryboard", bundle:nil)

        guard let nextVC = secondStoryboard.instantiateViewController(identifier: "TabBarController") as? TabBarController else {return}

        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:true, completion:nil)
    }

    @IBAction func goBackToLogin(_ sender: Any) {
        if viewcontrollers.count == 2 {
            viewcontrollers[1].navigationController?.popViewController(animated: false)
        }

        guard let presentingVC = self.presentingViewController as? UINavigationController else {return}

        self.dismiss(animated:true) {
            presentingVC.popToRootViewController(animated: false)
        }
    }
}
