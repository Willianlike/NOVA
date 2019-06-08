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

    var gameFieldView: GameFieldView?
    var curStep: GameStepView?

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
        gameFieldView = GameFieldView()
        view.addSubview(gameFieldView!)
        constrain(view, gameFieldView!) { (view, gameFieldView) in
            gameFieldView.top == view.top
            gameFieldView.leading == view.leading
            gameFieldView.trailing == view.trailing
            gameFieldView.bottom == view.bottom
            // for testing purposes
            gameFieldView.bottom == view.bottom - (self.tabBarController?.tabBar.frame.height ?? 0)
        }
        initStep(levelNum: 1, stepName: "step1")
    }

    func setupVM() {

    }

    func initStep(levelNum: Int, stepName: String) {
        curStep = GameStepView();
        for view in gameFieldView!.stepContent.subviews{
            view.removeFromSuperview()
        }
        curStep!.setNeedsLayout()
        print(curStep!.frame.height)
        gameFieldView!.stepContent.addSubview(curStep!)
    }
    
}
