//
//  GameStepModel.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxDataSources

struct GameStepModel: IdentifiableType {
    
//    var position: Position
    var episode: EpisodeModel
    
    var identity: String {
        return episode.name + "\(episode.passed)"// + position.rawValue
    }
    
    enum Position: String {
        case left
        case right
    }
    
    enum `Type`: String {
        case highlighted
        case blocked
        case passed
    }
    
}
