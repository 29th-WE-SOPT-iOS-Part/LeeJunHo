//
//  ThirdViewController.swift
//  ThirdViewController
//
//  Created by Junho Lee on 2021/10/08.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var passwordButtonCheck = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if let text1 = nameField.text, let text2 = passwordField.text, let text3=emailField.text {
            if (text1.count>=1)&&(text2.count>=1)&&(text3.count>=1){
                nextButton.isEnabled=true
            } else { nextButton.isEnabled=false }
        }
    }
    
    @IBAction func touchUpToBeSeen(_ sender: Any) {
        switch passwordButtonCheck {
        case 1 :
            passwordButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            passwordButtonCheck=2
            passwordField.isSecureTextEntry = false
        case 2 :
            passwordButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            passwordButtonCheck=1
            passwordField.isSecureTextEntry = true
        default: break
        }

    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? WelcomeVC else {return}
        
        guard let viewControllers = self.navigationController?.viewControllers else {return}
        print(viewControllers.count)
        nextVC.viewcontrollerss = viewControllers
        
        nextVC.message = nameField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion: nil)
    }

}
