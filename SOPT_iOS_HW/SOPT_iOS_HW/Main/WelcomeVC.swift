//
//  SecondViewController.swift
//  SecondViewController
//
//  Created by Junho Lee on 2021/10/07.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var OKButton: UIButton!
   
    var message: String?
    var viewcontrollerss : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
        // Do any additional setup after loading the view.
    }
    
    func setMessageInLabel(){
        if let msg = message{
            dataLabel.text = "\(msg)님\n환영합니다!"
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func goToTabBarSB(_ sender: Any) {
        let secondStoryboard = UIStoryboard.init(name: "TabBarStoryboard", bundle:nil)
        
        guard let nextVC = secondStoryboard.instantiateViewController(identifier: "TabBarController") as? TabBarController else {return}
        
        present(nextVC, animated:true, completion:nil)
    }
    
    
    @IBAction func goBackToLogin(_ sender: Any) {
        if viewcontrollerss.count == 2 {
            viewcontrollerss[1].navigationController?.popViewController(animated: false)
        }
            
        guard let presentingVC = self.presentingViewController as? UINavigationController else {return}
        
        self.dismiss(animated:true) {
            presentingVC.popToRootViewController(animated: false)
        }
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
