//
//  NetworkResult.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/05.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr(T)
    case serverErr(T)
    case networkFail
}
