//
//  FBBookListViewController+SearchBar.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import UIKit

extension FBBookListViewController: UISearchBarDelegate {

    
    //MARK: - SEARCH
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if(!(searchBar.text?.isEmpty)!){
            searchText = searchBar.text!
        }
    }
    
}
