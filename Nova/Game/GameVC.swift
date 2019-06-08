//
//  GamePathVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class GameVC: BaseVC {
    
    let vm: GameVM
    let table: GameTableView
    
    init() {
        vm = GameVM()
        
        table = GameTableView(steps: vm.steps)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Game"), image: UIImage(named: "gameTab"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(table)
        constrain(view, table) { (view, table) in
            table.edges == view.edges
        }
        table.transform = CGAffineTransform(rotationAngle: (-.pi))
        table.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        table.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: table.bounds.size.width - 10)
    }
    
}
