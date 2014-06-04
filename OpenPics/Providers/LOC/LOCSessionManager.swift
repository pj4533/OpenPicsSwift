//
//  LOCSessionManager.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

var kLOCBaseURLString = "http://www.loc.gov/pictures/"

class LOCSessionManager: AFHTTPSessionManager {
   
    struct Shared {
        static let Instance: LOCSessionManager = LOCSessionManager(baseURL: NSURL(string: kLOCBaseURLString))
    }

    init(baseURL url: NSURL!, sessionConfiguration configuration: NSURLSessionConfiguration!) {
        super.init(baseURL: url, sessionConfiguration: nil)
    }

    init(baseURL url: NSURL!) {
        super.init(baseURL: url)
        let responseSerializer = AFJSONResponseSerializer()
        responseSerializer.acceptableContentTypes = responseSerializer.acceptableContentTypes.setByAddingObject("text/plain")
        self.responseSerializer = responseSerializer
    }

}
