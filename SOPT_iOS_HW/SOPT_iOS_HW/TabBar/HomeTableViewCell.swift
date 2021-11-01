//
//  HomeTableViewCell.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(appData: HomeTableViewContentData) {
        titleLabel.text = appData.title
        subtitleLabel.text = appData.subtitle
    }
    
}
