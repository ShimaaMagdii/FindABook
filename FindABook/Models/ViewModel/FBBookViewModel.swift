//
//  FBBookViewModel.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import UIKit

// View Model Class to be used on UI
class FBBookViewModel: FBBaseViewModel {
    
    // MARK: - Properties
    var name :String!
    var coverUrl :String?
    var author :String?
    
    // MARK: - Init
    required public init(name: String!, coverUrl: String?, author: String?) {
        
        self.name = name
        self.coverUrl = coverUrl
        self.author = author
    }
    
}


