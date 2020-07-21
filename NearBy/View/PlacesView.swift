//
//  PlacesView.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit



class PlacesView: UIView {
    
    // MARK: - properties
    
    let navBar: NavigationBar = {
        let view = NavigationBar()
        view.pageName.text = "Near By"
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    var emptyState : EmptyStatusView = {
       let e = EmptyStatusView()
        e.emptyImage.image = #imageLiteral(resourceName: "address")
        e.labelEmpty.text = "No Data Found"
        return e
    }()
    
    
    // MARK: - lifeCycle
    func setupTableView(delegate:UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
        self.tableView.register(PlacesCell.self, forCellReuseIdentifier: PlacesCell.getIdentifier())
    }
    
    
   private func setupViews(){
    
        //constraints for navBar
        addSubview(navBar)
        navBar.anchor(top:topAnchor,leading: leadingAnchor,trailing: trailingAnchor)
    
        // setup tableView
        addSubview(tableView)
        tableView.anchor(top: navBar.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,paddingTop: 20,paddingLeft: 16,paddingBottom: 16,paddingRight: 16)
    }
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

