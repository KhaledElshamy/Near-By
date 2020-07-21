//
//  ModelStates.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


// MARK: - Stats
struct Stats: Codable {
    let tipCount, usersCount, checkinsCount, visitsCount: Int?
}
