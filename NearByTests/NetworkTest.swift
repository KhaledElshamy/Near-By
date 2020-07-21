//
//  NetworkTest.swift
//  NearByTests
//
//  Created by Khaled Elshamy on 7/21/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import XCTest
@testable import NearBy

class NetworkTest: XCTestCase {
    var sut: URLSession!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    
    func testValidCallRecentTripsHTTPStatusCode200(){
         let url =
         URL(string: "https://api.foursquare.com/v2/venues/search?ll=40.7,74&client_id=I5IVAR3XPPXRPTODR3NQYGNEE0IRKC2M3TRXQTGTA2ZEWMWW&client_secret=E2IPFHQQVB4GM0XBNKEU5F1S2QNJEEXFDBGD1DNPE35V02DI&v=20171029&radius=1000")
        
        let promise = expectation(description: "Status code: 200")
        
        var statusCode: Int?
        var responseError: Error?

        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
          statusCode = (response as? HTTPURLResponse)?.statusCode
          responseError = error
            if statusCode == 200 {
                promise.fulfill()
            }else{
                XCTFail("Status code: \(statusCode)")
            }
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}

