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
        setNavigationController()
        //checkToEnableBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTextFieldEmpty()
        print(self.navigationController?.viewControllers.count as Any)
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
    

    @IBAction func touchUpToSignUp(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC else {return}

        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func setTextFieldEmpty() {
        [nameField, emailField, passwordField].forEach {
            $0.text = ""
        }
    }
    
    func setNavigationController() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Alert를 Extension으로 뺴기 전
    
//    func successAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title,
//                                      message: message,
//                                      preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "확인" ,style: .default, handler: { (action) -> Void in
//            self.YesClick()
//            })
//
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
//
//    func failAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title,
//                                       message: message,
//                                      preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "확인" ,style: .default)
//
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
//
//    func YesClick() {
//        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
//
//        UserDefaults.standard.set(nameField.text, forKey: "nameText")
//
//        nextVC.modalPresentationStyle = .fullScreen
//        self.present(nextVC, animated:true, completion: nil)
//    }
}

extension LoginVC {
    func requestLogin(){
        UserLoginService.shared.login(email: emailField.text ?? "" , password: passwordField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                UserDefaults.standard.set(self.nameField.text, forKey: "nameText")
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
                    
                    welcomeVC.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(welcomeVC, animated: true)
                })
            case .requestErr(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in self.setTextFieldEmpty()})
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
