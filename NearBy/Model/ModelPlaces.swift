//
//  ModelPlaces.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


// MARK: - ModelLocationPlaces
struct ModelLocationPlaces: Codable {
    let meta: Meta?
    let response: Response?
}

// MARK: - Response
struct Response: Codable {
    let venues: [Venue]?
    let confident: Bool?
}

// MARK: - BeenHere
struct BeenHere: Codable {
    let count, lastCheckinExpiredAt: Int?
    let marked: Bool?
    let unconfirmedCount: Int?
}

//// MARK: - Contact
//struct Contact: Codable {
//    
//}

// MARK: - HereNow
struct HereNow: Codable {
    let count: Int?
    let summary: Summary?
//    let groups: [JSONAny]?
}

enum Summary: String, Codable {
    case nobodyHere = "Nobody here"
}
