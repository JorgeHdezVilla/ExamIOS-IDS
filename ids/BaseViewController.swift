//
//  BaseViewController.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var presenter : BasePresenter?
    var presentWindow : UIWindow?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentWindow = UIApplication.shared.keyWindow
        presenter?.loadPresenter()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.unloadPresenter()
    }
    
    func setupPresenter<T: BasePresenter>(_ presenter: T) {
        self.presenter = presenter
    }
    
    func onViewControllerResult() {
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}
