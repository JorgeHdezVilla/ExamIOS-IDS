//
//  RepositoryDataSourceDelegate.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit

public protocol RepositoryDataSourceDelegate: NSObjectProtocol {

    func onRepositoryClick(repository: Repository)
    
}
