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

struct Param {
    var name: String
    var value: Int
}

let energyVal = Variable<Int>(100)
let paramsVal = Variable<[Param]>([Param(name: "Время", value: 100),
                                   Param(name: "Сила", value: 100),
                                   Param(name: "Здоровье", value: 100),
                                   Param(name: "Питание", value: 100)])

let defaultCornerRadius: CGFloat = 12
