//
//  UIViewController + Extension.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/04.
//

import UIKit

extension UIViewController: CustomViewDelegate {
    func touchUpToGoLogin() {
        let secondStoryboard = UIStoryboard.init(name: "Main", bundle:nil)

        guard let nextVC = secondStoryboard.instantiateViewController(identifier: "NavigationController") as? NavigationController else {return}

        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated:true, completion:nil)
    }
}
