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
        
        // works if I use the base class directly
        let locSessionManager: AFHTTPSessionManager = AFHTTPSessionManager(baseURL: NSURL(string: kLOCBaseURLString))
        let responseSerializer = AFJSONResponseSerializer()
        responseSerializer.acceptableContentTypes = responseSerializer.acceptableContentTypes.setByAddingObject("text/plain")
        locSessionManager.responseSerializer = responseSerializer

        // Crashes when using the derived class
//        let locSessionManager: LOCSessionManager = LOCSessionManager(baseURL: NSURL(string: kLOCBaseURLString))
        
        // Can't use singleton either
//        LOCSessionManager.Shared.Instance.GET("search", parameters: params, success: {
        locSessionManager.GET("search", parameters: params, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) -> () in
            println(responseObject)
            
            }, failure: {
                (task: NSURLSessionDataTask!, error: NSError!) -> () in
                println("ERROR")
                println(error)
                
                
            })
    }

}
