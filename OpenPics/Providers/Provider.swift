//
//  Provider.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

class Provider: NSObject {
    var providerType: String?
    var providerName: String?
    var providerShortName: String?
    var supportsInitialSearching: Bool = false
    
    init(fromProviderType providerType:String) {
        self.providerType = providerType
    }

    var isConfigured: Bool {
        return true
    }
    
    func getItems(queryString: String,pageNumber: Int, success: (items: ImageItem[]!, canLoadMore: Bool!) -> (), failure: (error: NSError!) -> ()) {
        
    }

}
