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
    
    static let neededHeight: CGFloat = topHeight + botHeight
    static let topHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    static let botHeight: CGFloat = 44
    
    let energyBar = EnergyBar()
    let title: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        l.textAlignment = .center
        return l
    }()
    let leftBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "sourceTree"), for: .normal)
        return btn
    }()
    let content: UIView = {
        let v = UIView()
        return v
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
        addSubview(content)
        content.addSubview(energyBar)
        content.addSubview(title)
        content.addSubview(leftBtn)
        
        constrain(self, content, energyBar, title, leftBtn) { (view, content, bar, title, left) in
            bar.trailing == content.trailing - 16
            bar.top == content.top
            bar.bottom == content.bottom
            bar.width == VCNavigation.botHeight
            
            left.leading == content.leading + 16
            left.top == content.top
            left.bottom == content.bottom
            left.width == VCNavigation.botHeight
            
            title.top == content.top + 16
            title.centerX == content.centerX
            title.bottom == content.bottom - 16
            
            content.edges == inset(view.edges, UIApplication.shared.statusBarFrame.height, 0, 0, 0)
        }
    }
    
}
