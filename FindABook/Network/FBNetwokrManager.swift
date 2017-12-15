//
//  FBNetwokrManager.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation
import Alamofire



typealias SuccessNetworkClousre = (Any?)  -> Void
typealias FailureNetworkClousre = (Error) -> Void

public class FBNetwokrManager {
    
    /**
     Requests data from API and get the response back.
     
     - Parameter baseURL: Base URL for the API.. 
     - Parameter path: API path.
     - Parameter requestMethod: request method .GET .POST etc..
     - Parameter parameters: request parameters.
     - Parameter headers: request headers.
     - Parameter success: response success block.
     - Parameter failure: response failure block.
     */
    
    class func performRequestWithPath (baseUrl          :String = Network.baseUrl,
                                       path             :String?,
                                       requestMethod    :Alamofire.HTTPMethod,
                                       requestParam     :[String: Any]?,
                                       headersParam     :[String: String]?,
                                       success          :@escaping SuccessNetworkClousre,
                                       failure          :@escaping FailureNetworkClousre){
        
        
        let url = (path != nil) ? baseUrl + path! : baseUrl
        Alamofire.request(url, method: requestMethod, parameters: requestParam, headers: headersParam)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case  .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
}

