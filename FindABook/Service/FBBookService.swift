//
//  FBBookService.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation
import ObjectMapper

typealias ErrorClosure      = (Error) -> Void
typealias ViewModelClosure  = ([FBBookViewModel]?) -> Void

class FBBookService  {
    
    /**
     Get books data from API.
     - Parameter searchPhrase: search text if found.
     - Parameter success: response success block with ViewModelClosure.
     - Parameter failure: response failure block with Error.
     */
    
    func getDataFromApiFor (searchPhrase: String, success :@escaping ViewModelClosure , failure: @escaping ErrorClosure) {
        getBooksData(searchPhrase: searchPhrase, success: success, failure: failure)
    }
    
    private func getBooksData (searchPhrase: String, success :@escaping ViewModelClosure , failure: @escaping ErrorClosure){
        
        let path = String(format:Network.getBooks, searchPhrase)
        
        FBNetwokrManager.performRequestWithPath(baseUrl: Network.baseUrl, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { (reponse) in
            
            let  booksData:  FBBooksListModel? = Mapper<FBBooksListModel>().map(JSONObject: reponse)
            
            let bookList: [FBBookViewModel]? = FBMappingManager.mapBooksListToBooksViewModel(booksLData: booksData)
            
            success(bookList)
            
        }, failure: failure)
    }
    
}

