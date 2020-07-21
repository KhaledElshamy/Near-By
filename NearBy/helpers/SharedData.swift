//
//  SharedData.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/21/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit
import KeychainSwift


class SharedData {
    
    static var instance = SharedData()
    
    private let responseObjectKey = "responseObjectKey"
    private var keyChain = KeychainSwift()
    
    
    func saveResponse ( place : [Venue]? ) {
        guard let place = place else {
            return
        }
        
        keyChain.delete(responseObjectKey)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(place) {
            keyChain.set( encoded , forKey: responseObjectKey )
        }
    }

    func getResponse () -> [Venue]? {
        if let savedPerson = keyChain.getData(responseObjectKey) {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode([Venue].self, from: savedPerson) {
                return loadedPerson
            }
        }
        return nil
    }
    
    
    func clearData () {
        keyChain.delete(responseObjectKey)

    }
}
