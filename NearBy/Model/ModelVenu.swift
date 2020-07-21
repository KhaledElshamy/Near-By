//
//  ModelVenu.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


// MARK: - Venue
class Venue: Codable {
    let id, name: String?
//    let contact: Contact?
    let location: Location?
    let categories: [Category]?
    let verified: Bool?
    let stats: Stats?
    let beenHere: BeenHere?
    let hereNow: HereNow?
    let referralID: String?
//    let venueChains: [JSONAny]?
    let hasPerk: Bool?
    let venuePage: VenuePage?

    enum CodingKeys: String, CodingKey {
        case id, name, location, categories, verified, stats, beenHere, hereNow
        case referralID = "referralId"
        case hasPerk, venuePage
    }
}


// MARK: - VenuePage
struct VenuePage: Codable {
    let id: String?
}
