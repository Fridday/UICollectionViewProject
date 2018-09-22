//
//  ConnectionHelper.swift
//  UICollectionViewProject
//
//  Created by Farid on 9/22/18.
//  Copyright © 2018 SMON. All rights reserved.
//

import Foundation
import Reachability

class ConnectionHelper {
    
    init(){}

    static func checkInternet () -> Bool {
        
        let myReachability : Reachability = Reachability.init(hostName: "www.google.com")
        let internetStatus : NetworkStatus = myReachability.currentReachabilityStatus()
        
        if internetStatus != .NotReachable {
            return true
        }
        return false
    }
}
