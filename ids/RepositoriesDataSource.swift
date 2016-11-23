//
//  RepositoriesDataSource.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

class RepositoriesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var repositoryDataSourceDelegate  : RepositoryDataSourceDelegate?
    var repositories : [Repository] = []
    var tableView : UITableView?
    
    init(withTableView tableView:UITableView?, repositoryDataSourceDelegate  : RepositoryDataSourceDelegate){
        self.tableView = tableView
        self.repositoryDataSourceDelegate = repositoryDataSourceDelegate
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 40
    }
    
    func update(repositories: [Repository] ){
        self.repositories = repositories
        tableView?.reloadData()
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositorieTableViewCell", for: indexPath as IndexPath) as! RepositorieTableViewCell
        
        let repository = self.repositories[indexPath.row]
        
        cell.mNameRepositorieLabel.text = repository.name
        cell.mNameAutorLabel.text = repository.username
        cell.mDescriptionLabel.text = repository.descrip
        
        cell.repositoryDataSourceDelegate = repositoryDataSourceDelegate
        cell.repository = repository
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true);
        self.repositoryDataSourceDelegate?.onRepositoryClick(repository: repositories[indexPath.row])
    }
    
    
}
