//
//  FirstViewController.swift
//  FirstViewController
//
//  Created by Junho Lee on 2021/10/07.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    
    //MARK: - TextFields
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var nextButton: UIButton!

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled=true
        //checkToEnableBtn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
    }

    //MARK: - Custom Methods

//    func checkToEnableBtn() {
//        [nameField, emailField, passwordField].forEach {
//            $0.addTarget(self, action:
//                #selector(self.textFieldDidChange(_:)),for:.editingChanged)
//        }
//    }
 
//    @objc func textFieldDidChange(_ sender:Any?) -> Void {
//        if let text1 = nameField.text, let text2 = passwordField.text, let text3=emailField.text {
//            if (text1.count>=1)&&(text2.count>=1)&&(text3.count>=1){
//                nextButton.isEnabled=true
//            } else { nextButton.isEnabled=false }
//        }
//    }

    @IBAction func touchUpToSendData(_ sender: Any) {
        requestLogin()
    }
    
    func YesClick() {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        
        nextVC.message = nameField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion: nil)
    }

    @IBAction func touchUpToSignUp(_ sender: Any) {
        guard let nextVC2 = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC else {return}

        self.navigationController?.pushViewController(nextVC2, animated: true)
    }
    
    func setTextFieldEmpty() {
        [nameField, emailField, passwordField].forEach {
            $0.text = ""
        }
    }
    
    func successAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,style: .default, handler: { (action) -> Void in
            self.YesClick()
            })
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func failAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                       message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginVC {
    func requestLogin(){
        UserSignService.shared.login(email: emailField.text ?? "" , password: passwordField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                    if let userData = response.data {
                        self.successAlert(title: response.message, message: "\(userData.name)님 환영합니다!")
                }
            case .requestErr(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                self.failAlert(title: "로그인", message: response.message)
            case .pathErr(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                self.failAlert(title: "로그인", message: response.message)
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
