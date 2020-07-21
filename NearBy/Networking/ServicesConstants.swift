//
//  PlacesApi.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


class ServicesContants {
    
     static var BaseURL : String {
        return "https://api.foursquare.com/v2"
    }
    
    static let foursquareClientId = "I5IVAR3XPPXRPTODR3NQYGNEE0IRKC2M3TRXQTGTA2ZEWMWW"
    static let foursquareClientSecret = "E2IPFHQQVB4GM0XBNKEU5F1S2QNJEEXFDBGD1DNPE35V02DI"
    
    
    struct HTTPHeaderField  {
        static var authentication = "Authorization"
        static var contentType = "Content-Type"
        static var acceptType = "Accept"
        static var acceptEncoding = "Accept-Encoding"
        static var locale = "X-locale"
    }
    
    
    struct ContentType  {
       static var json = "application/json"
       static var bearer = "Bearer"
       static var form = "application/x-www-form-urlencoded"
    }
    
}
