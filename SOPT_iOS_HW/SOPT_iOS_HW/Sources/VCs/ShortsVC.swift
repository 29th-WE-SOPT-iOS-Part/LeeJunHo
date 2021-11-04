//
//  SecondVC.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/15.
//

import UIKit

class ShortsVC: UIViewController {

    @IBOutlet weak var CustomNavigationBar: CustomNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavigationBar.delegate = self
        // Do any additional setup after loading the view.
    }
}
