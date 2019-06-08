//
//  TabBarController.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(vcs: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = vcs
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
