//
//  ApiRouter.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Alamofire
import Foundation

enum ApiRouter : URLRequestConvertible {
    
    case getPlaces(data: [String:String])
    
    private var Methods : HTTPMethod {
        switch self {
           case .getPlaces: return .get
        }
    }
    
    private var Parameters : Parameters? {
        switch self {
        case .getPlaces(let data):
            return data
        }
    }
    
    private var Headers : HTTPHeaders {
        switch self {
        case .getPlaces:
             return [
                ServicesContants.HTTPHeaderField.acceptType : ServicesContants.ContentType.json ,
                ServicesContants.HTTPHeaderField.contentType  : ServicesContants.ContentType.json
            ]

        }
    }
    
    
    private var Paths : String {
        switch self {
        case .getPlaces(let data):
            let dic = changeDictionaryToQueryURL(dic: data)
            print(dic)
            return "/venues/search?\(dic)"
        }
        
        
        
    }
    
    func asURLRequest() throws -> URLRequest {
        
            let url = "\(ServicesContants.BaseURL)\(Paths)"
            let safeUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            var urlRequest = URLRequest(url: URL(string: safeUrl!)!)
            urlRequest.httpMethod = Methods.rawValue
            urlRequest.headers = Headers
            if Methods.rawValue != "GET"{
                if let parameters = Parameters {
                    do {
                        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    }catch{
                        throw AFError.parameterEncodingFailed(reason:.jsonEncodingFailed(error: error))
                    }
                }
            }
            return urlRequest
    }
    
    
    func changeDictionaryToQueryURL (dic : [String : String]) -> String {
        var stringArray : [String] = []
        
        dic.forEach { (item) in
            if !item.value.isEmpty {
                stringArray.append("\(item.key)=\(item.value)")
            }else {
                stringArray.append("\(item.key)")
            }
        }
        
        var str = ""
        
        stringArray.forEach { (s) in
            if str.isEmpty {
                str = s
            }else {
                str = str + "&" + s
            }
        }
        
        return str
    }
    
}
