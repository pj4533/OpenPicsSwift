//
//  ProviderCollectionViewController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

let reuseIdentifier = "generic"

class ProviderCollectionViewController: UICollectionViewController {

    var items = ImageItem[]()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView.registerClass(ContentCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        let derpTest = ProviderController.Shared.Instance.providerByType(ProviderTypeLOC)
        if derpTest {
            derpTest!.getItems("", pageNumber: 1, success:{ (items: ImageItem[]!, canLoadMore: Bool!) -> () in
                
                self.items = items
                self.collectionView.reloadData()
                
                }, failure: { (error: NSError!) -> () in
                    println(error)
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

// #pragma mark UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {

        return 1
    }


    override func collectionView(collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    override func collectionView(collectionView: UICollectionView?, cellForItemAtIndexPath indexPath: NSIndexPath?) -> UICollectionViewCell? {
        let cell = collectionView?.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as ContentCell
    
        let item = self.items[indexPath!.item]
        
        cell.imageView.setImageWithURL(item.imageUrl)
        
        return cell
    }

    // pragma mark <UICollectionViewDelegate>

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    func collectionView(collectionView: UICollectionView?, shouldHighlightItemAtIndexPath indexPath: NSIndexPath?) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    func collectionView(collectionView: UICollectionView?, shouldSelectItemAtIndexPath indexPath: NSIndexPath?) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    func collectionView(collectionView: UICollectionView?, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath?) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView?, canPerformAction action: String?, forItemAtIndexPath indexPath: NSIndexPath?, withSender sender: AnyObject) -> Bool {
        return false
    }

    func collectionView(collectionView: UICollectionView?, performAction action: String?, forItemAtIndexPath indexPath: NSIndexPath?, withSender sender: AnyObject) {
    
    }
    */

}
