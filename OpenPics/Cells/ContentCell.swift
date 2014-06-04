//
//  ContentCell.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {

    @IBOutlet var imageView : UIImageView
    
    override func prepareForReuse() {
        if imageView {
            imageView.image = nil
        }
    }
    
}
