//
//  KnowledgeVM.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import RxSwift

class KnowledgeVM {
    
    let cards = Variable<[KnowledgeModel]>([])
    
    
    
    init() {
//        cards.value = Array(repeating: KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description escription"), count: 11)
        cards.value = [KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description escription"),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription"),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription"),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription"),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true),
                       KnowledgeModel(image: UIImage(named: "emptyTool"), name: "Empty", description: " description description description description description description description description description description description description description description escription", startHidden: true)]
    }
}
