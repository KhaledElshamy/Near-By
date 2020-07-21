//
//  PlacesViewModel.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

protocol ProUpdateView: StatusApi {
    func reloadData()
}

protocol ProNearbyPlaces {
    
    func getNearbyPlaces(lat:Double,long:Double)
    func getNumberOfPlaces() -> Int
    func cellConfiguration(cell:ProSendPlacesData,index:Int)
    
    func getLocalResponse()
}

protocol ProSendPlacesData {
    func sendData(data: Venue)
}

class PlacesViewModel: ProNearbyPlaces {
    
    private var nearbyPlacesService = PlacesServices()
    private weak var view: ProUpdateView?
    
    init(view: ProUpdateView) {
        self.view = view
    }
    
    var places = [Venue]()
    
    // MARK: - get nearby places
    func getNearbyPlaces(lat: Double, long: Double) {
        
        self.view?.showLoading()
        self.nearbyPlacesService.getPlaceServices(lat: lat, long: long) { [weak self](data, error, statusCode) in
            
            guard let self = self else {return}
            self.view?.hideLoading()
            
            if statusCode == 200 {
                self.places = data?.response?.venues ?? []
                SharedData.instance.clearData()
                SharedData.instance.saveResponse(place: data?.response?.venues ?? [])
                self.view?.reloadData()
            }
        }
    }
    
    
    // MARK: - get number of places
    func getNumberOfPlaces() -> Int {
        return self.places.count
    }
    
    
    // MARK: - send data to cell
    func cellConfiguration(cell: ProSendPlacesData, index: Int) {
        cell.sendData(data: self.places[index])
    }
    
    
    
    // MARK: - get data from local
    func getLocalResponse() {
        self.nearbyPlacesService.getLocalResponse { (places) in
            self.places = places
            self.view?.reloadData()
        }
    }
}
