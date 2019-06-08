
//
//  ToolsVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit


class ToolsVC: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Tools"), image: UIImage(named: "toolsTab"), tag: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
