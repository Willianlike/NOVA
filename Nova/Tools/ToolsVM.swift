//
//  ToolsVM.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift

class ToolsVM {
    
    let cards = Variable<[ToolModel]>([])
    
    
    
    init() {
        cards.value = Array(repeating: ToolModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description escription"), count: 11)
    }
}
