//
//  FBMappingManager.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation

class FBMappingManager {
    
    
    /**
     Map FBBookModel to FBBookViewModel.
     
     - Parameter FBBookModel: bookModel to be mapped.
     - Returns : mapped FBBookViewModel array.
     .
     */
    class func mapBooksListToBooksViewModel(booksLData: FBBooksListModel?) -> [FBBookViewModel] {
        
        var bookList = [FBBookViewModel]()
        
        
        if let books = booksLData?.bookList {
            for book in books {
                let mappedBook = FBBookViewModel(name: book.volumeInfo?.title ?? "" , coverUrl: book.volumeInfo?.imageLinks?.smallimage, author: "")
                bookList.append(mappedBook)
            }
        }
        return bookList
        
    }
    
    
    
}
