//
//  ViewPresenter.swift
//  ids
//
//  Created by Lennken Group on 11/23/16.
//  Copyright © 2016 Test. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewPresenter: BasePresenter {

    var delegate : ViewDelegate?
    var request : Alamofire.Request?
    
    init(delegate: ViewDelegate) {
        self.delegate = delegate
    }
    
    func repositories(language : String){
        if ConnectionUtils.isConnectedToNetwork(){
            self.delegate!.onStartDownloadData()
            //let params = Mapper().toJSON(RegisterProfileRequest(withEmail: email, withPassword: password, withFullName: userName, withPictureProfile: ""))
            //request = Alamofire.request(.POST, Urls.API_REGISTER_PROFILE, parameters: params, method: .post, headers: nil)
            let stringUrl = String(format: Urls.API_REPOSITORIES, language, language)
            
            //let stringUrl = String(format: Urls.API_REPOSITORIES, arguments: language, language)
            request = Alamofire.request(stringUrl ,method: .get, parameters: nil, headers: nil).responseObject(completionHandler: {(response:DataResponse<RepositoriesResponse>) in
                switch response.result{
                    case .success:
                        self.delegate!.onSuccessDownloadData(response: response.result.value!)
                    case .failure(_):
                        self.delegate!.onErrorDownloadData()
                }
                
            })
        }else{
            self.delegate!.onErrorConnection()
        }
    }
    
}
