//
//  EmptyState.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit


class EmptyStatusView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    
    lazy var emptyImage : UIImageView = {
        let i = UIImageView()
        return i
    }()
    
    lazy var labelEmpty : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        return l
    }()
    
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
        
        self.addSubview(emptyImage)
        self.addSubview(labelEmpty)
        
        emptyImage.anchor( centerX: self.centerXAnchor , centerY: self.centerYAnchor ,  width: 200 , height: 200 )
        labelEmpty.anchor(top: emptyImage.bottomAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , paddingTop: 16 , paddingLeft: 16 , paddingRight: 16 )
    }
    
}
