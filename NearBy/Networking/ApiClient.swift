//
//  ApiClient.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Alamofire


typealias CompletionHandler <T : Codable> = ( T? , AFError? , _ statusCode : Int ) -> ()


class ApiClient <T : Decodable > {
    
    @discardableResult
    static func performRequest(route:ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,AFError> , _ statusCode : Int )->Void) -> DataRequest {
        return AF.request(route)
                .responseDecodable(decoder:decoder) {(response: DataResponse<  T , AFError >) in
                    completion(response.result , response.response?.statusCode ?? -1 )
        }
    }
     

     @discardableResult
     static func performRequestString(route:ApiRouter, completion:@escaping (AFDataResponse<String>)->Void) -> DataRequest {
         return AF.request(route).responseString(completionHandler: { (str) in
             completion(str)
             })
     }
}
