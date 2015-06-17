//
//  ProviderCollectionViewController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/15/15.
//  Copyright © 2015 Say Goodnight Software. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ThumbnailCollectionViewController: UICollectionViewController {

    let dataSource = ImageDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.collectionView!.dataSource = dataSource
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        // Force 4 items across, regardless of width -- has the side affect of making 3 across when launched in landscape and rotated
        let itemSize = (self.view.frame.width - 6) / 4
        layout.itemSize = CGSizeMake(itemSize, itemSize)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! FullScreenCollectionViewController
        vc.collectionView!.dataSource = dataSource
        vc.currentIndexPath = (self.collectionView!.indexPathsForSelectedItems()?.first)!
    }

}
