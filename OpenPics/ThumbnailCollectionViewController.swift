//
//  ProviderCollectionViewController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/15/15.
//  Copyright © 2015 Say Goodnight Software. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ThumbnailCollectionViewController: UICollectionViewController, UINavigationControllerDelegate {

    let dataSource = ImageDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.delegate = self
        self.collectionView!.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // this overrides the deprecated willRotate function
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)

        // this fixes the problem of rotation & then returning to this view controller.  for some reason
        // it doesn't set the frame size properly, even though the size is sent in correctly.
        if self.navigationController?.visibleViewController != self {
            self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, size.width, size.height)
        }
        
        self.collectionView!.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Force 4 items across, regardless of width
        let itemSize = (self.collectionView!.frame.width - 6) / 4
        return CGSizeMake(itemSize, itemSize)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! FullScreenCollectionViewController
        vc.useLayoutToLayoutNavigationTransitions = true
    }

    // MARK: - UINavigaitonControllerDelegate
    
    // this is here because i need to know when the other collection view is shown, and set the delete.  by default
    // layout to layout transitions use the root controllers delegate and data source
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let vc = viewController as? UICollectionViewController {
            vc.collectionView!.delegate = vc
        }
    }
}
