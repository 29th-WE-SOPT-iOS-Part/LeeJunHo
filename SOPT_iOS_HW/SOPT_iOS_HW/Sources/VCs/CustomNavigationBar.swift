//
//  CustomNavigationBar.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/04.
//

import UIKit

class CustomNavigationBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        //alternativeCustomInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
        //alternativeCustomInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
}
