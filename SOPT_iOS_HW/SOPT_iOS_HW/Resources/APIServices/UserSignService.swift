//
//  UserSignService.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/05.
//

import Foundation
import Alamofire

struct UserSignService{
    static let shared = UserSignService()
    
    func login(email: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.loginURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isValidLoginData(data: data)
        case 400: return isPathErr(data: data)
        case 500: return isServerErr(data: data)
        default: return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr(data)}
        return .success(decodeData)
    }
    private func isPathErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr(data)}
        return .pathErr(decodeData)
    }
    private func isServerErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr(data)}
        return .serverErr(decodeData)
    }
    
    func signUp(email: String, name: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signUpURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
}

struct UserSignUpService{
    static let shared = UserSignUpService()
    
    func signUp(email: String, name: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.signUpURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "name": name,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isValidSignUpData(data: data)
        case 400: return isPathErr(data: data)
        case 500: return isServerErr(data: data)
        default: return .networkFail
        }
    }
    
    private func isValidSignUpData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr(data)}
        return .success(decodeData)
    }
    private func isPathErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr(data)}
        return .pathErr(decodeData)
    }
    private func isServerErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr(data)}
        return .serverErr(decodeData)
    }
}
