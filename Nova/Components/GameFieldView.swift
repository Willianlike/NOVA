//
//  GameFieldView.swift
//  Nova
//
//  Created by Ilia Yurasov on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import UIKit
import MBCircularProgressBar

class GameFieldView : UIView {

    let nibName = "GameFieldView"

    @IBOutlet weak var bottomBar: UIView!
    @IBOutlet var content: UIView!
    @IBOutlet weak var valueTime: MBCircularProgressBarView!
    @IBOutlet weak var valueStrength: MBCircularProgressBarView!
    @IBOutlet weak var valueHealth: MBCircularProgressBarView!
    @IBOutlet weak var valueHunger: MBCircularProgressBarView!
    @IBOutlet weak var progressConstraint: NSLayoutConstraint!
    @IBOutlet weak var stageName: UILabel!
    @IBOutlet weak var backButton: RoundButton!
    @IBOutlet weak var valuePower: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle(for: NovaTopBar.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(content)
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
