//
//  ViewController.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import PKHUD
import ActionSheetPicker_3_0

class ViewController: BaseViewController, ViewDelegate, RepositoryDataSourceDelegate {
    
    var viewPresenter : ViewPresenter?
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mLanguageButton: UIButton!
    
    var mRepositoriesDataSource : RepositoriesDataSource?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPresenter = ViewPresenter(delegate: self)
        setupPresenter(viewPresenter!)
        
        mRepositoriesDataSource = RepositoriesDataSource(withTableView: mTableView, repositoryDataSourceDelegate: self)
        mTableView.delegate = mRepositoriesDataSource
        mTableView.dataSource = mRepositoriesDataSource
        
        mLanguageButton.layer.cornerRadius = 5
        mLanguageButton.layer.borderColor = UIColor.lightGray.cgColor
        mLanguageButton.layer.borderWidth = 1.0
    
        
        viewPresenter?.repositories(language: "Swift")
        
    }
    
    func onRepositoryClick(repository: Repository){
        let view = self.storyboard?.instantiateViewController(withIdentifier: "detailRepositoryViewController") as! DetailRepositoryViewController
        view.repository = repository
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func onSuccessDownloadData(response : RepositoriesResponse){
        PKHUD.sharedHUD.hide(animated: true)
        mRepositoriesDataSource?.update(repositories: response.repositories!)
    }
    
    @IBAction func onLanguagesClick(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Select a Language", rows: ["Swift", "Android", "C#", "Java", "HTML", "CSS", "JavaScript"], initialSelection: 0, doneBlock: {
            picker, value, index in
            
            self.mLanguageButton.setTitle(index as! String?, for: UIControlState.normal)
            self.viewPresenter?.repositories(language: (index as! String?)!)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    func onStartDownloadData(){
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    func onErrorDownloadData(){
        PKHUD.sharedHUD.hide(animated: true)
    }
    
    func onErrorConnection(){
        PKHUD.sharedHUD.hide(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

