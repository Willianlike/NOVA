//
//  EpisodeTopBar.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class EpisodeTopBar: UIView {
    
    static let needHeight: CGFloat = VCNavigation.neededHeight
    
    let backBtn: UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "backBtn"), for: .normal)
        return l
    }()
    
    let progress: UIProgressView = {
        let l = UIProgressView(progressViewStyle: .bar)
        l.progress = 0.5
        l.progressTintColor = .orangeBase
        l.trackTintColor = .blueBase
        return l
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    let content: UIView = {
        let l = UIView()
        l.backgroundColor = .clear
        let g = GradientView()
        l.addSubview(g)
        constrain(l, g, block: { (l, g) in
            g.leading == l.leading
            g.bottom == l.bottom
            g.trailing == l.trailing
            g.height == l.height + VCNavigation.topHeight
        })
        g.startColor = .blueBase
        
        g.endColor = .blueSup
        return l
    }()
    
    let energyBar = EnergyBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(content)
        content.addSubview(backBtn)
        content.addSubview(progress)
        content.addSubview(title)
        content.addSubview(energyBar)
        
        constrain(backBtn, progress, self, title, content, energyBar) { (backBtn, progress, view, title, content, energyBar) in
            content.top == view.top + VCNavigation.topHeight
            content.leading == view.leading
            content.trailing == view.trailing
            content.bottom == view.bottom
            
            backBtn.top == content.top + 8
            backBtn.leading == content.leading + 16
            backBtn.bottom == content.bottom - 8
            backBtn.width == backBtn.height
            
            title.leading == backBtn.trailing + 8
            title.trailing == energyBar.leading - 8
            title.top == content.top
            title.bottom == content.bottom
            
            energyBar.trailing == content.trailing - 16
            energyBar.width == 44
            energyBar.height == 44
            energyBar.centerY == content.centerY
            
            progress.leading == view.leading
            progress.trailing == view.trailing
            progress.top == view.bottom
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
