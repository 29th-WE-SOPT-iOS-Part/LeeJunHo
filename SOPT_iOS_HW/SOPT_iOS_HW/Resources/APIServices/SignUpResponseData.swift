//
//  SignUpResponseData.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/09.
//

import Foundation

// MARK: - signUP

struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData?
}

// MARK: - DataClass
struct SignUpResultData: Codable {
    let id: Int
    let name: String
//    let password: Int
    let email: String
}
