//
//  GameStepView.swift
//  Nova
//
//  Created by Ilia Yurasov on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import Foundation
import UIKit

class GameStepView : UIView {

    let nibName = "GameStepView"

    @IBOutlet var content: UIView!
    @IBOutlet weak var stepDescription: UILabel!
    @IBOutlet weak var stepImage: UIImageView!
    @IBOutlet weak var stepQuestion: UILabel!

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
