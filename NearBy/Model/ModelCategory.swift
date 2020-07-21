//
//  ModelCategory.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import Foundation


// MARK: - Category
struct Category: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Icon?
    let primary: Bool?
}
