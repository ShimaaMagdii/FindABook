//
//  FBBooksListModel.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of books API into.
class FBBooksListModel :FBBaseMappable {
    
    private(set) var totalItems: Int?
    private(set) var bookList: [FBBookModel]?
    
    override func mapping(map: Map) {
        totalItems <- map [MappingKey.totalItems]
        bookList <- map [MappingKey.bookList]
    }
}

class FBBookModel : FBBaseMappable {
    
    private(set) var volumeInfo : FBVolumeInfoModel?
    override func mapping(map: Map) {
        volumeInfo <- map [MappingKey.volumeInfo]
    }
}

class FBVolumeInfoModel : FBBaseMappable {
    private(set) var title: String?
    private(set) var authors: [String]?
    private(set) var imageLinks: FBImagesModel?
    
    override func mapping(map: Map) {
        title <- map [MappingKey.title]
        authors <- map [MappingKey.authors]
        imageLinks <- map [MappingKey.imageLinks]
    }
}

class FBImagesModel : FBBaseMappable {
    private(set) var smallimage: String?
    override func mapping(map: Map) {
        smallimage <- map [MappingKey.smallimage]
    }
}

fileprivate struct MappingKey {
    static let smallimage             : String = "smallThumbnail"
    static let imageLinks             : String = "imageLinks"
    static let authors                : String = "authors"
    static let title                  : String = "title"
    static let volumeInfo             : String = "volumeInfo"
    static let totalItems             : String = "totalItems"
    static let bookList               : String = "items"
    
}

