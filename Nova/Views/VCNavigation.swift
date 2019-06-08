//
//  VCNavigation.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class VCNavigation: UIView {
    
    let energyBar = EnergyBar()
    let title: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return l
    }()
    let leftBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "empty"), for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    private func didLoad() {
        addSubview(energyBar)
        addSubview(title)
        addSubview(leftBtn)
        
        constrain(self, energyBar, title, leftBtn) { (view, bar, title, left) in
            bar.trailing == view.trailing - 16
            bar.top == view.top + 16
            bar.bottom == view.bottom - 16
            bar.width == 60
            
            left.leading == view.leading + 16
            left.top == view.top + 16
            left.bottom == view.bottom - 16
            left.width == 44
            
            title.top == view.top + 16
            title.centerX == view.centerX
            title.bottom == view.bottom - 16
        }
    }
    
}
