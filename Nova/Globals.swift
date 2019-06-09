//
//  Globals.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

struct Param: JSONDecodable {
    
    init(json: JSON) throws {
        name = json["title"].stringValue
        value = json["count"].intValue
    }
    
    var name: String
    var value: Int = 100
    var color: UIColor = .white
    
    init(name: String,
         value: Int = 100,
         color: UIColor = .white) {
        self.name = name
        self.value = value
        self.color = color
    }
}

let energyVal = Variable<Int>(100)


//let gameEpisodes = Variable<[GameStepModel]>(
//    [GameStepModel(episode: EpisodeModel(name: "String",
//                                         energy: -12,
//                                         passed: false,
//                                         steps: [StepModel(]
//                                         regardsTools: [
//                                            ToolModel(image: "empty", name: "Tool1", description: "Desc") ],
//                                         regardsKnowledge: [
//                                            KnowledgeModel(image: "empty", name: "know1", description: "desc", startHidden: true)]
//        )
//        )
//    ]
//)
let episodesVal = Variable<[GameStepModel]>([])

let paramsVal = Variable<[Variable<Param>]>([Variable<Param>(Param(name: "Время", value: 100, color: .yel)),
                                   Variable<Param>(Param(name: "Сила", value: 40, color: .carrot)),
                                   Variable<Param>(Param(name: "Здоровье", value: 35, color: .blueBase)),
                                   Variable<Param>(Param(name: "Питание", value: 87, color: .birusa))])



//let toolsVal = Variable<[ToolModel]>(Array(repeating: ToolModel(image: "emptyTool", name: "Empty", description: " description description escription"), count: 11))
let toolsVal = Variable<[ToolModel]>([])





let knowledgeVal = Variable<[KnowledgeModel]>([])
//let knowledgeVal = Variable<[KnowledgeModel]>([KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description escription"),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription"),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription"),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription"),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
//                                               KnowledgeModel(image: "emptyTool", name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true)])
let defaultCornerRadius: CGFloat = 12
