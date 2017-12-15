//
//  Constants.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation
import UIKit



struct bookListVCContants {
    static let bookCellIdentifier          :String  = "bookCell"
    static let searchBardentifier          :String  = "searchbarHeader"
    static let strMsg                      :String  = "You selected %@ by %@"
    
}

struct Network {
    
    static let baseUrl                      :String = "https://www.googleapis.com/"
    static let getBooks                     :String = "books/v1/volumes?q=%@"
}



