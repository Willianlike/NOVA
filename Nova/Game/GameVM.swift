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
        steps.value = [GameStepModel(stepId: "1", stepType: .blocked, position: .left, energy: -12),
                       GameStepModel(stepId: "2", stepType: .blocked, position: .right, energy: -12),
                       GameStepModel(stepId: "3", stepType: .blocked, position: .left, energy: -12),
                       GameStepModel(stepId: "4", stepType: .blocked, position: .right, energy: -12),
                       GameStepModel(stepId: "5", stepType: .blocked, position: .left, energy: -12),
                       GameStepModel(stepId: "6", stepType: .blocked, position: .right, energy: -12),
                       GameStepModel(stepId: "7", stepType: .blocked, position: .left, energy: -12),
                       GameStepModel(stepId: "8", stepType: .blocked, position: .right, energy: -12),
                       GameStepModel(stepId: "9", stepType: .blocked, position: .left, energy: -12),
                       GameStepModel(stepId: "10", stepType: .blocked, position: .right, energy: -12),
                       GameStepModel(stepId: "11", stepType: .passed, position: .left, energy: -12)].reversed()
    }
    
}
