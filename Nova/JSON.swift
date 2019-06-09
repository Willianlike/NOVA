//
//  JSON.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONDecodable {
    init(json: JSON) throws
}
