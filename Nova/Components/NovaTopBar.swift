//
//  NovaTopBar.swift
//  Nova
//
//  Created by Ilia Yurasov on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import UIKit

class NovaTopBar: UIView {

    @IBOutlet weak var backButton: RoundButton!
    @IBOutlet weak var progressConstraint: NSLayoutConstraint!
    @IBOutlet weak var stageTitle: UILabel!

    let nibName = "NovaTopBar"

    @IBOutlet var content: UIView!

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
