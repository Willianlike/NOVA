//
//  ToolModel.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

struct ToolModel {
    
    var image: UIImage
    var name: String
    var description: String
    
    init(image: UIImage,
         name: String,
         description: String) {
        self.image = image
        self.name = name
        self.description = description
    }
    
}
