//
//  FirstViewController.swift
//  FirstViewController
//
//  Created by Junho Lee on 2021/10/07.
//

import UIKit

class SignUpVC: UIViewController {
    
    //MARK: - TextFields
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var nextButton: UIButton!

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        checkToEnableBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }

    //MARK: - Custom Methods

    func checkToEnableBtn() {
        [nameField, emailField, passwordField].forEach {
            $0.addTarget(self, action:
                #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        }
    }
 
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if let text1 = nameField.text, let text2 = passwordField.text, let text3=emailField.text {
            if (text1.count>=1)&&(text2.count>=1)&&(text3.count>=1){
                nextButton.isEnabled=true
            } else { nextButton.isEnabled=false }
        }
    }

    @IBAction func touchUpToSendData(_ sender: Any) {

        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}

        nextVC.message = nameField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion: nil)
    }

    @IBAction func touchUpToSignUp(_ sender: Any) {
        guard let nextVC2 = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as? SignInVC else {return}

        self.navigationController?.pushViewController(nextVC2, animated: true)
    }
    
    func setTextFieldEmpty() {
        [nameField, emailField, passwordField].forEach {
            $0.text = ""
        }
    }
}
