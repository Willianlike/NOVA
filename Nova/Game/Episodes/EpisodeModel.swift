//
//  EpisodeModel.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

struct EpisodeModel: JSONDecodable {
    init(json: JSON) throws {
        name = json["title"].stringValue
        energy = json["count"].intValue
        passed = false
        steps = try json["steps"].arrayValue.map({ try StepModel(json: $0) })
        regardsTools = try json["regardsTools"].arrayValue.map({ try ToolModel(json: $0) })
        regardsKnowledge = try json["regardsKnowledge"].arrayValue.map({ try KnowledgeModel(json: $0) })
    }
    
    var name: String
    var energy: Int
    var passed: Bool
    var steps: [StepModel]
    var regardsTools: [ToolModel]
    var regardsKnowledge: [KnowledgeModel]
}

struct StepModel: JSONDecodable {
    init(json: JSON) throws {
        name = "step"
        question = json["question"].stringValue
        desc = json["title"].stringValue
        answers = try json["answers"].arrayValue.map({ try AnswerModel(json: $0) })
        image = json["image"].stringValue
        isLast = false
    }
    
    var name: String
    var desc: String
    var question: String
    var isLast: Bool
    var image: String
    var answers: [AnswerModel]
    
}

struct AnswerModel: JSONDecodable {
    init(json: JSON) throws {
        image = json["image"].stringValue
        title = json["name"].stringValue
        changeParams = try json["settings"].arrayValue.map({ try Param(json: $0) })
    }
    var image: String
    var title: String
    var changeParams: [Param]
    let click = PublishSubject<AnswerModel>()
}
