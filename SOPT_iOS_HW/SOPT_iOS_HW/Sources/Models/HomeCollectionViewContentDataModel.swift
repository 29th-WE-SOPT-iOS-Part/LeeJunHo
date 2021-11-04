//
//  HomeCollectionViewContentData.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/10/29.
//

import UIKit

struct HomeCollectionViewContentData{
    let subscLabel: String
    let imageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
