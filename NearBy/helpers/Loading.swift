//
//  Loading.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit
import JGProgressHUD

class Loading {
    
    static let instance = Loading()
    
    private var progress = JGProgressHUD(style: .light)
    
    private init(){
        
    }
    
    func showLoading(view : UIView) {
          hideLoading()
          progress.textLabel.text = nil
          progress.indicatorView = JGProgressHUDIndeterminateIndicatorView()
          progress.show(in: view)
      }
      
      func hideLoading () {
          progress.dismiss()
      }
      
      func showProgress (view : UIView ) {
             progress.show(in: view)
             progress.textLabel.text = "Uploading"
             progress.indicatorView = JGProgressHUDRingIndicatorView()
         }
         
    func setProgress ( value : Float ) {
        progress.progress = value
    }
    
    
}
