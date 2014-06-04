//
//  LOCProvider.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

var ProviderTypeLOC = "com.saygoodnight.loc"

class LOCProvider: Provider {
    init(fromProviderType providerType: String) {
        super.init(fromProviderType: providerType)
        self.providerName = "Library of Congress"
        self.supportsInitialSearching = true
    }
    
    override func getItems(queryString: String,pageNumber: Int, success: (items: ImageItem[]!, canLoadMore: Bool!) -> (), failure: (error: NSError!) -> ()) {
        
        let params = [
            "q" : queryString,
            "sp" : pageNumber,
            "fo" : "json",
            "c" : "100"
        ]
        
        LOCSessionManager.Shared.Instance.GET("search", parameters: params, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) -> () in
            
            let dict = responseObject as NSDictionary
            
            let resultArray = dict["results"] as NSArray
            var retArray = ImageItem[]()
            for itemDict : AnyObject in resultArray {
                let imageDict = itemDict["image"] as NSDictionary
                if imageDict != nil {
                    
                    let imageUrl = NSURL(string: imageDict["full"] as String)
                    let opImageDict = [
                        "imageUrl" : imageUrl
                    ]
                    
                    retArray.append(ImageItem(imageUrl: imageUrl))
                }
            }
            
            success(items: retArray, canLoadMore: false)
            
            }, failure: {
                (task: NSURLSessionDataTask!, error: NSError!) -> () in
                println("ERROR")
                println(error)
                
                
            })
    }

}
