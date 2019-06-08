//
//  TestVC.swift
//  Nova
//
//  Created by Ilia Yurasov on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//


import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import Cartography

class TestVC: BaseVC {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupVM()
    }

    func setupUI() {
        let gameFieldView = GameFieldView()
        view.addSubview(gameFieldView)
        constrain(view, gameFieldView) { (view, gameFieldView) in
            gameFieldView.top == view.top
            gameFieldView.leading == view.leading
            gameFieldView.trailing == view.trailing
            gameFieldView.bottom == view.bottom
            // for testing purposes
            gameFieldView.bottom == view.bottom - (self.tabBarController?.tabBar.frame.height ?? 0)
        }
    }

    func setupVM() {

    }
    
}
