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
        categoryUIView.layer.cornerRadius = 17
        categoryUIView.layer.borderWidth = 1
        categoryUIView.layer.borderColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 1).cgColor
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                //select
                categoryUIView.backgroundColor = UIColor(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
                categoryLabel.textColor = .white
            } else {
                //unselect
                categoryUIView.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
                categoryLabel.textColor = .black
            }
        }
    }
    
    func setData(appData: HomeCategoryViewContentData) {
        categoryLabel.text = appData.categoryText
    }
}
