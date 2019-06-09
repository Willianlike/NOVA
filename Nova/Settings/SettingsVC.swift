//
//  SettingsVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class SettingsVC: BaseVC {
    
    let leftBtn : UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(named: "pencil"), for: .normal)
        b.setTitle(loc.tr("Change"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        b.tintColor = .white
        return b
    }()
    
    let energyBar: EnergyBar = {
        let v = EnergyBar()
        return v
    }()
    
    let profileImage: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    let profilename: UILabel = {
        let v = UILabel()
        return v
    }()
    
    let content: UIView = {
        let v = UIView()
        return v
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = SettingsVC.tabItem
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Settings"), image: UIImage(named: "settingsTab"), tag: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(content)
        content.addSubview(leftBtn)
        content.addSubview(energyBar)
        content.addSubview(profilename)
        content.addSubview(profileImage)
        
        constrain(view, content, leftBtn, energyBar) { (view, content, leftBtn, energyBar) in
            leftBtn.leading == content.leading + 16
            leftBtn.top == content.top
            leftBtn.height == 44
            
            energyBar.top == content.top
            energyBar.trailing == content.trailing - 16
            energyBar.height == 44
            energyBar.width == 44
            
            
            
            
            content.edges == inset(view.edges, VCNavigation.topHeight, 0, 0, 0)
        }
    }
    
}
