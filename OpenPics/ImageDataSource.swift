//
//  ImageDataSource.swift
//  OpenPics
//
//  Created by PJ Gray on 6/16/15.
//  Copyright © 2015 Say Goodnight Software. All rights reserved.
//

import UIKit

class ImageDataSource: NSObject, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        // Configure the cell
        cell.imageView.contentMode = .ScaleAspectFit
        cell.imageView.image = UIImage(named: "photo\(indexPath.item)")
        
        return cell
    }

}
