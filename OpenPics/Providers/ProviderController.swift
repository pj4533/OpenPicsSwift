//
//  ProviderController.swift
//  OpenPics
//
//  Created by PJ Gray on 6/3/14.
//  Copyright (c) 2014 Say Goodnight Software. All rights reserved.
//

import UIKit

class ProviderController: NSObject {

    struct Shared {
        static let Instance: ProviderController = ProviderController()
    }
    
    var providers = Provider[]()
    
    func addProvider(provider: Provider) {
        if provider.isConfigured {
            self.providers.append(provider)
        }
    }
    
    func providerByType(providerType: String) -> Provider? {
        
        for thisProvider in providers {
            if thisProvider.providerType == providerType {
                return thisProvider
            }
        }
        
        return nil
    }
    
}
