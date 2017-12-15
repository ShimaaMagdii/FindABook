//
//  FBBookListViewController.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation
import UIKit
/**
 *  FB Book List CollectionView controller contains the books details showen on list
 */
class FBBookListViewController: FBBaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    // MARK: - Properties
    private  let bookService: FBBookService = FBBookService()
    
    
    var booksList = [FBBookViewModel](){
        didSet{
            bookCollectionView.reloadData()
        }
    }
    internal var searchText: String? {
        didSet {
            if let text = searchText {
                loadDataWithSearchText(searchText: text)
            }
        }
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    //MARK:- Private Methods
    internal func loadDataWithSearchText(searchText: String) {
        showProgressBar()
        bookService.getDataFromApiFor(searchPhrase: searchText, success: {[weak self] (modelArray) in
            guard let strongSelf = self else { return }
            strongSelf.hideProgressBar()
            strongSelf.booksList = modelArray ?? []
        }) {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.hideProgressBar()
            strongSelf.handleError(error: error)
        }
    }
}


