//
//  loc.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation

struct loc {
    
    static func tr(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
}
