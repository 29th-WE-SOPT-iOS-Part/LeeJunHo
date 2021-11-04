//
//  ThirdViewController.swift
//  ThirdViewController
//
//  Created by Junho Lee on 2021/10/08.
//

import UIKit

class SignUpVC: UIViewController {

    //MARK: - TextFields

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: - vars

    private var passwordButtonCheck = 1

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        checkToEnableBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }

    //MARK: - Custom Method

    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if let text1 = nameField.text, let text2 = passwordField.text, let text3=emailField.text {
            if (text1.count>=1)&&(text2.count>=1)&&(text3.count>=1){
                nextButton.isEnabled=true
            } else { nextButton.isEnabled=false }
        }
    }
    
    func checkToEnableBtn() {
        [nameField, emailField, passwordField].forEach {
            $0.addTarget(self, action:
                #selector(self.textFieldDidChange(_:)),for:.editingChanged)
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
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}

        guard let viewControllers = self.navigationController?.viewControllers else {return}
        nextVC.viewcontrollers = viewControllers

        nextVC.message = nameField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion: nil)
    }

    func setTextFieldEmpty() {
        [nameField, emailField, passwordField].forEach {
            $0.text = ""
        }
    }
}
