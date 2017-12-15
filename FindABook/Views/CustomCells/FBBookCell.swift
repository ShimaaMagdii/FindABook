//
//  FBBookCell.swift
//  FindABook
//
//  Created by Shimaa Magdi on 12/15/17.
//  Copyright © 2017 Shimaa Magdi. All rights reserved.
//

import UIKit
import Kingfisher

typealias ImageDownloadCompletion = () -> Void

/**
 *  FBBookCell table view cell displays the book details.
 */
class FBBookCell: UICollectionViewCell {
    
   
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 8
        containerView.dropCardShadow()
    }
    
    /**
     Customize Cell With Model displays details for each book model.
     - Parameter book: FBBookViewModel contains book details.
     - Parameter completion: ImageDownloadCompletion colusre that handles getting the image.
     */
    func customizeCellWithModel(_ book: FBBookViewModel?,  completion: @escaping ImageDownloadCompletion) {
        
        if let selectedBook = book {
            bookName.text = selectedBook.name
            if let urlString = selectedBook.coverUrl {
                let url = URL(string: urlString)
                bookCover.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "defult_cover") , options: nil, progressBlock: nil, completionHandler: {(image, error, cacheType, url) in
                    if cacheType == .none || cacheType == .disk {
                        completion()
                    }
                })
            }
        }
    }
    
    
}
