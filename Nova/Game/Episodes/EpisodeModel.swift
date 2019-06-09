//
//  EpisodeModel.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift

struct EpisodeModel {
    
    var name: String
    var energy: Int
    var steps: [StepModel]
    
}

struct StepModel {
    
    var name: String
    var desc: String
    var question: String
    var isLast: Bool
    var answers: [AnswerModel]
    
}

struct AnswerModel {
    var image: String
    var title: String
    var changeParams: [Param]
    let click = PublishSubject<AnswerModel>()
}
