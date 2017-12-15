//
//  FBBookListViewController+CollectionView.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import UIKit

extension FBBookListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.booksList.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bookListVCContants.bookCellIdentifier, for: indexPath as IndexPath) as! FBBookCell
        cell.customizeCellWithModel(self.booksList[indexPath.item], completion: {})
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedBook = self.booksList[indexPath.item]
        let msg = String(format: "You selected %@ for the author %@", selectedBook.name, selectedBook.author ?? "")
        showMessage(message: msg)
        
    }
}
