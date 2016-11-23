//
//  Repositorie.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import ObjectMapper

public class Repository: NSObject, Mappable {
    
    var type : String?
    var username : String?
    var name : String?
    var owner : String?
    var homepage : String?
    var descrip: String?
    var language : String?
    var watchers : Int?
    var followers : Int?
    var forks : Int?
    var size : Int?
    var open_issues : Int?
    var score : Double?
    var has_downloads : Bool?
    var has_issues : Bool?
    var has_wiki : Bool?
    var fork : Bool?
    var privat : Bool?
    var url : String?
    var created : String?
    var created_at : String?
    var push_at : String?
    var pushed : String?
    
    override init(){
        super.init()
    }
    
    required public init?(map: Map){
        
    }
    
    open func mapping(map: Map){
        type              <- map["type"]
        username              <- map["username"]
        name              <- map["name"]
        owner              <- map["owner"]
        homepage              <- map["homepage"]
        descrip              <- map["description"]
        language              <- map["language"]
        watchers              <- map["watchers"]
        followers              <- map["followers"]
        forks              <- map["forks"]
        size              <- map["size"]
        open_issues              <- map["open_issues"]
        score              <- map["score"]
        has_downloads              <- map["has_downloads"]
        has_issues              <- map["has_issues"]
        has_wiki              <- map["has_wiki"]
        fork              <- map["fork"]
        privat              <- map["private"]
        url              <- map["url"]
        created              <- map["created"]
        created_at              <- map["created_at"]
        push_at              <- map["push_at"]
        pushed              <- map["pushed"]
    }

}
