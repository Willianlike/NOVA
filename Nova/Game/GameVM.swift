//
//  GameVM.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class GameVM {
    
    let steps = Variable<[GameStepModel]>([])
    
    init() {
        steps.value = gameEpisodes.value
    }
    
}
