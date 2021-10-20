//
//  FirstViewController.swift
//  FirstViewController
//
//  Created by Junho Lee on 2021/10/07.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    @IBOutlet weak var nextButton: UIButton!
    
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
    
    
    @IBAction func touchUpToSendData(_ sender: Any) {

        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        

        nextVC.message = nameField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated:true, completion: nil)
    }
    
    
    @IBAction func touchUpToSignUp(_ sender: Any) {
        
        guard let nextVC2 = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        

        self.navigationController?.pushViewController(nextVC2, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
