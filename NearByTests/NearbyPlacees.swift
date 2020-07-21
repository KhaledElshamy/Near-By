//
//  NearbyPlacees.swift
//  NearByTests
//
//  Created by Khaled Elshamy on 7/21/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import XCTest
@testable import NearBy

class NearbyPlacees: XCTestCase {
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNearbyPlacesData(){
        
        let lat = 40.7
        let long = 74.0
        
        let data : [String:String] = ["ll": String(format: "%f,%f", lat, long),"client_id":ServicesContants.foursquareClientId,"client_secret": ServicesContants.foursquareClientSecret,"v": "20171029","radius": "1000"]
        
        ApiClient<ModelLocationPlaces>.performRequest(route: .getPlaces(data: data)) { (res, statusCode) in
            
            XCTAssertNil(data)
            XCTFail("Status code: \(statusCode)")
            
            switch res {
            case .success(let data):
                XCTAssert(data.response?.venues?.count == 5, "data isn't correct")
            case .failure(let error):
                XCTFail("error is: \(error)")
            }
        }
        
    }

}
