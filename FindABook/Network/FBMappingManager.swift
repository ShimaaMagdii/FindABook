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
              var authors = ""
                if let authorsList = book.volumeInfo?.authors {
                     authors = authorsList.flatMap({$0}).joined(separator:", ")
                }
                let mappedBook = FBBookViewModel(name: book.volumeInfo?.title ?? "" , coverUrl: book.volumeInfo?.imageLinks?.smallimage, author: authors)
                bookList.append(mappedBook)
            }
        }
        return bookList
        
    }
    
    
    
}
