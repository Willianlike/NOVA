//
//  SettingsVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit


class SettingsVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Settings"), image: UIImage(named: "settingsTab"), tag: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
