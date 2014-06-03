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
}
