//
//  Delay.swift
//  unanime
//
//  Created by Lory on 08/04/2015.
//  Copyright (c) 2015 PH. All rights reserved.
//

import UIKit

extension NSObject {
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure
        )
    }
}