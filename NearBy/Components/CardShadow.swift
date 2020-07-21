//
//  CardShadow.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit

class CardShadow : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addShadow () {
        // set the shadow of the view's layer
     //   layer.backgroundColor = UIColor.clear.cgColor
        backgroundColor = .white
        let color = UIColor.black.withAlphaComponent(0.20)
        layer.shadowColor = color.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 4
    }
    
}
