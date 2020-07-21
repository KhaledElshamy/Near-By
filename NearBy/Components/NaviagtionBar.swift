//
//  NaviagtionBAr.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/21/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

@objc protocol NavigationBarDelegate : class {
    @objc optional func navigationDismissView()
}

class  NavigationBar : UIView {
    
    weak var delegateNavigation : NavigationBarDelegate?
    
    private let heightStatusBar = UIApplication.shared.statusBarFrame.height
    
    private var heightConstant : CGFloat = 0
    
    private var heightNavigation : NSLayoutConstraint?
    
//    var isHiddenNavigation = false {
//        didSet {
//            if isHiddenNavigation {
//                heightNavigation?.constant = 0
//            }else {
//                heightNavigation?.constant = heightConstant
//            }
//        }
//    }
//
    let pageName: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.boldSystemFont(ofSize: 20)
        return name
    }()
    
    let mode: UILabel = {
        let label = UILabel()
        label.text = "Single Update"
        label.textColor = Colors.blueColor
        label.isUserInteractionEnabled = true 
        return label
    }()
    
    private func setupviews(){
        addSubview(pageName)
        pageName.anchor(top:safeAreaLayoutGuide.topAnchor,centerX: self.centerXAnchor,paddingTop: 10)
        
        addSubview(mode)
        mode.anchor(top:pageName.topAnchor,trailing: trailingAnchor,paddingRight: 24)
    }
    
   
    private func setShadow () {
        self.backgroundColor = .white
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)  //Here youcontrolx and y
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0 //Here your control your blur
        self.layer.masksToBounds =  false
    }
    
    init() {
        super.init(frame: .zero)
        setupviews()
        heightConstant = heightStatusBar + 60
        heightNavigation = self.heightAnchor.constraint(equalToConstant: heightConstant )
        heightNavigation?.isActive = true
        self.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
}

