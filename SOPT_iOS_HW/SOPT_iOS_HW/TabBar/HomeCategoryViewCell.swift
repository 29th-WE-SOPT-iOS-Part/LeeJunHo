//
//  HomeCategoryViewCell.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/29.
//

import UIKit

class HomeCategoryViewCell: UICollectionViewCell {

    static var identifier = "HomeCategoryViewCell"
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryUIView: UIView!
    
    
    
    func setUIConfiguration(){
        categoryUIView.backgroundColor = .white
        categoryUIView.layer.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1).cgColor
        categoryUIView.layer.cornerRadius = 12
        categoryUIView.layer.borderWidth = 1
        categoryUIView.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(appData: HomeCategoryViewContentData) {
        categoryLabel.text = appData.categoryText
    }
}
