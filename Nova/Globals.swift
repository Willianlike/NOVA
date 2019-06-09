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
    var color: UIColor
}

let energyVal = Variable<Int>(100)
let paramsVal = Variable<[Variable<Param>]>([Variable<Param>(Param(name: "Время", value: 100, color: .yel)),
                                   Variable<Param>(Param(name: "Сила", value: 40, color: .carrot)),
                                   Variable<Param>(Param(name: "Здоровье", value: 35, color: .blueBase)),
                                   Variable<Param>(Param(name: "Питание", value: 87, color: .birusa))])

let defaultCornerRadius: CGFloat = 12
