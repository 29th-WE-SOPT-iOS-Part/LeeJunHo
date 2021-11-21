//
//  UserSignService.swift
//  SOPT_iOS_HW1
//
//  Created by Junho Lee on 2021/11/05.
//

import Foundation
import Alamofire

struct UserLoginService{
    static let shared = UserLoginService()
    
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
        case 200: return isValidSignUpData(data: data)
        case 400: return isRequestErr(data: data)
        case 404: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidSignUpData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodeData)
    }
    private func isRequestErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr}
        return .requestErr(decodeData)
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
        case 400: return isRequestErr(data: data)
        case 404: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidSignUpData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodeData)
    }
    private func isRequestErr(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignUpResponseData.self, from: data)
        else {return .pathErr}
        return .requestErr(decodeData)
    }
}
