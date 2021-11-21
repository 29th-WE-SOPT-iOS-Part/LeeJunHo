//
//  APIConstants.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/05.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    static let loginURL = baseURL + "/user/login"
    static let signUpURL = baseURL + "/user/signup"
}
