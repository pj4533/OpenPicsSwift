//
//  FullScreenCollectionViewController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/16/15.
//  Copyright © 2015 Say Goodnight Software. All rights reserved.
//

import UIKit

class FullScreenCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    //TODO: This is not good -- the currentIndex variable comes from the tutorial, I added the currentIndexPath for 
    // jumping to the selected item
    var currentIndex: CGFloat  = 0.0
    var currentIndexPath: NSIndexPath = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //TODO: cannot scroll until the item appears -- doesn't look good at all
    override func viewDidAppear(animated: Bool) {
        self.collectionView!.scrollToItemAtIndexPath(self.currentIndexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        //TODO: don't understand this content inset stuff, if i return the frame size, the layouts item size is undefined because
        // "the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values."
//        return self.collectionView!.frame.size

        // If I subtract the content inset, then it works without the error
        let layout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        NSLog("SECTION: %@", NSStringFromUIEdgeInsets(layout.sectionInset))
        NSLog("CONTENT: %@", NSStringFromUIEdgeInsets(self.collectionView!.contentInset))
        
        return CGSizeMake(self.collectionView!.frame.size.width, self.collectionView!.frame.size.height - self.collectionView!.contentInset.top) 
    }
    
    // This is from the tutorial: http://adoptioncurve.net/archives/2013/04/creating-a-paged-photo-gallery-with-a-uicollectionview/
    // Helps to handle rotation...seems old and out of date though?
    // TODO: at least change the currentIndex stuff -- what does currentIndex mean?
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.collectionView!.collectionViewLayout.invalidateLayout()
        
        let currentOffset = self.collectionView!.contentOffset
        self.currentIndex = currentOffset.x / self.collectionView!.frame.size.width
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        let currentSize = self.collectionView!.bounds.size
        let offset = self.currentIndex * currentSize.width
        self.collectionView!.setContentOffset(CGPointMake(offset, 0.0), animated: false)
    }
}
