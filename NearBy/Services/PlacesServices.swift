//
//  PlacesServices.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


class PlacesServices {
    
    func getPlaceServices(lat:Double,long:Double,completion: @escaping CompletionHandler<ModelLocationPlaces>){
        
        let data : [String:String] = ["ll": String(format: "%f,%f", lat, long),"client_id":ServicesContants.foursquareClientId,"client_secret": ServicesContants.foursquareClientSecret,"v": "20171029","radius": "1000"]
        
        ApiClient<ModelLocationPlaces>.performRequest(route: .getPlaces(data: data)) { (result, statusCode) in
            switch result {
            case .success(let data):
                completion(data,nil,statusCode)
                return
            case .failure(let error):
                completion(nil,error,statusCode)
                return
            }
        }
    }
    
    
    func getLocalResponse(completion: @escaping ([Venue]) ->()) {
        let response = SharedData.instance.getResponse() ?? []
        completion(response)
    }
}
