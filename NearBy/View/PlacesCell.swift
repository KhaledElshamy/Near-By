//
//  PlacesCell.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit


class PlacesCell: UITableViewCell {
    
    // MARK: - properties
    
    private var cardShadow = CardShadow()
    
    private var placeImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.image = #imageLiteral(resourceName: "icons8-no-image-gallery-50")
        return image
    }()
    
    private var placeName: UILabel = {
        let label = UILabel()
        label.text = "sdfnksdfkhdskfhk"
        label.numberOfLines = 2
        return label
    }()
    
    private var placeDetails: UILabel = {
        let label = UILabel()
        label.textColor = Colors.grayColor
        label.text = "sdfksdhfjsdfshdfkhskdhfhdskfhhsdfhskdhfksdhfhksdhfkhsdkhfksdhf"
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: - lifeCycle
    func setupConstraints(){
        self.contentView.addSubview(cardShadow)
        
        // constraints for placeImage
        addSubview(placeImage)
        placeImage.anchor(top:topAnchor,leading: leadingAnchor,bottom: bottomAnchor,paddingTop: 12,paddingLeft: 12,paddingBottom: 12,width: 80,height: 80 )
        
        // constraints for placeName
        addSubview(placeName)
        placeName.anchor(top:placeImage.topAnchor,leading: placeImage.trailingAnchor,trailing: trailingAnchor,paddingLeft: 8, paddingRight: 12)
        
        // constraints for placeDetails
        addSubview(placeDetails)
        placeDetails.anchor(top:placeName.bottomAnchor,leading: placeName.leadingAnchor,trailing: trailingAnchor,paddingTop: 4,paddingRight: 12)
        
        self.bottomAnchor.constraint(equalTo: placeImage.bottomAnchor,constant: 5).isActive = true
        
        self.cardShadow.anchor(top:contentView.topAnchor,leading: contentView.leadingAnchor,bottom: contentView.bottomAnchor,trailing: contentView.trailingAnchor,paddingTop: 4,paddingLeft: 4,paddingBottom: 4,paddingRight: 4)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




extension PlacesCell: ProSendPlacesData{
    
    func sendData(data: Venue) {
        
        if data.categories!.count > 0 {
            if let prefix = data.categories?[0].icon?.iconPrefix, let suffix = data.categories?[0].icon?.suffix {
                let imageURL = "\(prefix)original\(suffix)"
                self.placeImage.loadImage(url: imageURL)
            }
        }
        
        self.placeName.text = data.name
        self.placeDetails.text = "\(data.location?.address ?? "")" + "\(data.location?.crossStreet ?? "")"
    }
}
