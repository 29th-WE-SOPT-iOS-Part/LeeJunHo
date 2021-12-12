//
//  HomeTableViewCell.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/28.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    public var delegate: homeTVDelegate?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTapGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setTapGesture()
    }
    
    func setData(appData: HomeTableViewContentData) {
        titleLabel.text = appData.title
        subtitleLabel.text = appData.subtitle
    }
    
    func setTapGesture() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(gestureRecognizer:)))
        mainImageView.addGestureRecognizer(tapRecognizer)
    }

    @objc func tapImageView(gestureRecognizer: UIGestureRecognizer){
        self.delegate?.tapToNextVC()
    }
}
