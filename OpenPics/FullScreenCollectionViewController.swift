//
//  FullScreenCollectionViewController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/16/15.
//  Copyright © 2015 Say Goodnight Software. All rights reserved.
//

import UIKit

class FullScreenCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var visibleIndexPath = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TODO:  I was still getting that weird insets error -- I couldn't figure it out.  So to move forward I just make the height 80% of the
    // collectionview height.  Problem solved for now.  Will come back later?
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.collectionView!.frame.size.width, self.collectionView!.frame.size.height * 0.8)
    }
    
    // Here I turn paging on for this controller, and off when I leave cause remember the collectionView is shared
    // for layout to layout transitions
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView!.pagingEnabled = true
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.collectionView!.pagingEnabled = false
    }
    
    // Changed this from the tutorial code http://adoptioncurve.net/archives/2013/04/creating-a-paged-photo-gallery-with-a-uicollectionview/
    // Seems to work better, and makes more sense to just track the visible indexPath and scroll to it, rather than calculating offsets.
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.collectionView!.alpha = 0.0

        self.visibleIndexPath = self.collectionView!.indexPathsForVisibleItems().first!
        self.collectionView!.collectionViewLayout.invalidateLayout()

    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        self.collectionView!.scrollToItemAtIndexPath(self.visibleIndexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
        
        UIView.animateWithDuration(0.125) { () -> Void in
            self.collectionView!.alpha = 1.0
        }
    }
    
}
