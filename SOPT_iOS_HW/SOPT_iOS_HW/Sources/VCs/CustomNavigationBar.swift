//
//  CustomNavigationBar.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/04.
//

import UIKit

class CustomNavigationBar: UIView {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    public var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        imageViewToButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
        imageViewToButton()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    func imageViewToButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(customObjc))
        profileImage.addGestureRecognizer(tapGesture)
        profileImage.isUserInteractionEnabled = true
    }
    
    @objc func customObjc(){
        self.delegate?.touchUpToGoLogin()
    }
}

protocol CustomViewDelegate {
    func touchUpToGoLogin()
}
