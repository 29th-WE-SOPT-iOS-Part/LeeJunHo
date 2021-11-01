//
//  HomeVCCollectionViewCell.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/29.
//

import UIKit

class HomeVCCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeVCCollectionViewCell"
    
    @IBOutlet weak var subscLabel: UILabel!
    @IBOutlet weak var subscImageVIew: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCollectionData(appData: HomeCollectionViewContentData) {
        subscLabel.text = appData.subscLabel
        subscImageVIew.image = appData.makeImage()
    }
    
}
