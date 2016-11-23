//
//  RepositoriesResponse.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import ObjectMapper

public class RepositoriesResponse: NSObject, Mappable {

    var repositories : [Repository]?
    
    required public init(map: Map) {
        
    }
    
    public func mapping(map: Map){
        repositories  <- map["repositories"]
    }
    
}
