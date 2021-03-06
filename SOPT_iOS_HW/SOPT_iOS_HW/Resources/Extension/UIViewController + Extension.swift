//
//  UIViewController + Extension.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/04.
//

import UIKit
import Foundation

extension UIViewController: CustomViewDelegate {
    func touchUpToGoLogin() {
        let secondStoryboard = UIStoryboard.init(name: "Main", bundle:nil)

        guard let nextVC = secondStoryboard.instantiateViewController(identifier: "LoginVC") as? LoginVC else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension UIViewController: homeTVDelegate {
    func tapToNextVC(image: UIImage, title: String, description: String) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeDetailVC") as? HomeDetailVC else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: {
            nextVC.detailTitleLabel.text = title
            nextVC.detailImageView.image = image
            nextVC.detailDescriptionLabel.text = description
        })
    }
}

extension UIViewController {
    func makeAlert(title: String,
                   message: String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> ())? = nil)
    {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}

protocol homeTVDelegate {
    func tapToNextVC(image: UIImage, title: String, description: String)
}

protocol CustomViewDelegate {
    func touchUpToGoLogin()
}
