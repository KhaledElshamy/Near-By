//
//  BaseVc.swift
//  NearBy
//
//  Created by Khaled Elshamy on 7/20/20.
//  Copyright © 2020 Khaled Elshamy. All rights reserved.
//

import UIKit


protocol StatusApi : class  {
    func onError(_ message : String )
    func showLoading ()
    func hideLoading ()
    func showProgress()
    func setProgress (progress : Float )
}


class BaseVC <T : UIView > : UIViewController , StatusApi  {
    
    func onError(_ message : String ) {
         hideLoading()
     }
    
     func onFailure (_ message : String) {
         hideLoading()
     }
    
    func showLoading () {
        Loading.instance.showLoading(view: self.mainView)
    }
    
    func hideLoading () {
        refreshController?.endRefreshing()
        Loading.instance.hideLoading()
    }
    
    func showProgress() {
        Loading.instance.showProgress(view: self.view )
    }
    
    func setProgress (progress : Float ) {
        Loading.instance.setProgress(value: progress )
    }
    
    var refreshController : UIRefreshControl?
    
    override func loadView() {
        let t  = T()
        t.backgroundColor = .white
        self.view = t
    }
    
    var mainView : T {
        if let view = self.view as? T {
            return view
        }else {
         let view = T()
         self.view = view
         return view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}
