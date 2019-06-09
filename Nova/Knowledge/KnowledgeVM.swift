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
    
    
    
    let disposeBag = DisposeBag()
    
    init() {
        knowledgeVal.asObservable().bind(to: cards).disposed(by: disposeBag)
    }
}
