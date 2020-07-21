//
//  PlacesVC.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit
import CoreLocation
import Reachability

enum Mode {
    case realtime
    case singleUpdate
}

class PlacesVC: BaseVC<PlacesView> {
    
    private var locationManager: CLLocationManager?
    private var viewModel : ProNearbyPlaces?
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    let reachability = try! Reachability()
    var currentMode: Mode = .singleUpdate
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        viewModel = PlacesViewModel(view : self )
        self.mainView.setupTableView(delegate: self, dataSource: self)
        
        self.mainView.navBar.mode.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ChangeMode)))
    }
    
    // MARK: - change mode for fetch data
    @objc func ChangeMode(){
        switch currentMode {
        case .singleUpdate:
            currentMode = .realtime
            self.mainView.navBar.mode.text = "realtime"
            locationManager?.allowsBackgroundLocationUpdates = true
        case .realtime:
            currentMode = .singleUpdate
            self.mainView.navBar.mode.text = "Single Update"
            locationManager?.allowsBackgroundLocationUpdates = false
            locationManager?.stopUpdatingLocation()
        }
    }
    
    
    // MARK: - check for internet connection
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
          try reachability.startNotifier()
        }catch{
          print("could not start reachability notifier")
        }
    }
    
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            self.getUserLocation()
        case .cellular:
            self.getUserLocation()
        case .unavailable:
            self.viewModel?.getLocalResponse()
        case .none:
            print("")
        }
    }
    
    
    // MARK: - get user location
    private func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
}


extension PlacesVC: ProUpdateView {
    func reloadData() {
        self.mainView.tableView.reloadData()
    }
}


extension PlacesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.viewModel?.getNumberOfPlaces() ?? 0 == 0 {
            self.mainView.tableView.backgroundView = self.mainView.emptyState
        }
        return self.viewModel?.getNumberOfPlaces() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlacesCell.getIdentifier(), for: indexPath) as! PlacesCell
        
        self.viewModel?.cellConfiguration(cell: cell, index: indexPath.item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}



extension PlacesVC:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location.coordinate.latitude)
            self.viewModel?.getNearbyPlaces(lat: location.coordinate.latitude, long: location.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

