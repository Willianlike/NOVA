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
        curStep!.stepDescription.text = "step " + String(levelNum) + " description"
        curStep!.stepQuestion.text = "step question?"
        gameFieldView!.stepContent.addSubview(curStep!)

        let ans1 = AnswerView()
        ans1.title.text = "answer 1"
        let ans2 = AnswerView()
        ans2.title.text = "answer 2"
        let ans3 = AnswerView()
        ans3.title.text = "answer 3"
        let ans4 = AnswerView()
        ans4.title.text = "answer 4"

        curStep?.answers.addSubview(ans1)
        let offset = CGFloat(75)
        var rect = ans1.frame.offsetBy(dx: 0, dy: ans1.frame.height + offset)
        ans2.frame = rect
        curStep?.answers.addSubview(ans2)

        rect = ans2.frame.offsetBy(dx: 0, dy: ans1.frame.height + offset)
        ans3.frame = rect
        curStep?.answers.addSubview(ans3)

        rect = ans3.frame.offsetBy(dx: 0, dy: ans1.frame.height + offset)
        ans4.frame = rect
        curStep?.answers.addSubview(ans4)

    }
    
}
