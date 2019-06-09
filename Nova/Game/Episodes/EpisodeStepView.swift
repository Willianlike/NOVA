//
//  EpisodeStepView.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import Cartography

class EpisodeStepView: UIView {
    
    let disposeBag = DisposeBag()
    
    let answerClick = PublishSubject<AnswerModel>()
    
    let desc: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textColor = .darkGray
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    let image: UIImageView = {
        let l = UIImageView()
        constrain(l, block: { (l) in
            l.width == UIScreen.main.bounds.width * 2 / 3
            l.height == l.width
        })
        return l
    }()
    
    let question: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        l.textColor = .darkGray
        l.numberOfLines = 0
        l.textAlignment = .center
        return l
    }()
    
    var answers = UIView()
    
    func getAnswerView(answer: AnswerModel) -> UIView {
        let v = CornoredShadowView()
        let vc = UIView()
        let btn = UIButton()
        
        let lbl = UILabel()
        lbl.numberOfLines = 0
        
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        
        v.addSubview(vc)
        vc.addSubview(lbl)
        vc.addSubview(i)
        vc.addSubview(btn)
        vc.backgroundColor = .white
        vc.clipsToBounds = true
        vc.layer.cornerRadius = defaultCornerRadius
        
        constrain(v, vc, lbl, i, btn) { (v, vc, lbl, i, btn) in
            vc.edges == v.edges
            btn.edges == vc.edges
            
            i.leading == vc.leading + 16
            lbl.leading == i.trailing + 16
            lbl.trailing == vc.trailing - 16
            
            i.top >= vc.top + 16
            i.bottom <= vc.bottom - 16
            i.centerY == vc.centerY
            lbl.top == vc.top + 16
            lbl.bottom == vc.bottom - 16
            
            i.width == 30
            i.height == 30
            
        }
        
        lbl.text = answer.title
        i.image = UIImage(named: answer.image)
        
        btn.rx.tap.asObservable().map { _ in answer }.bind(to: answer.click).disposed(by: disposeBag)
        btn.rx.tap.asObservable().map { _ in answer }.bind(to: answerClick).disposed(by: disposeBag)
        
        return v
    }
    
    func getAnswersView(answers: [AnswerModel]) -> UIView {
        
        let content = UIView()
        let views = answers.map({ [unowned self] answer in
            return self.getAnswerView(answer: answer)
        })
        var lastView: UIView? = nil
        for view in views {
            content.addSubview(view)
            
            if let lastView = lastView {
                constrain(lastView, view) { (lastView, view) in
                    view.top == lastView.bottom + 16
                }
            } else {
                constrain(content, view) { (content, view) in
                    view.top == content.top + 16
                }
            }
            constrain(content, view) { (content, view) in
                view.leading == content.leading + 16
                view.trailing == content.trailing - 16
            }
            
            lastView = view
        }
        if let lastView = lastView {
            constrain(lastView, content) { (lastView, content) in
                lastView.bottom == content.bottom - 16
            }
        }
        return content
    }
    
    init(step: StepModel) {
        super.init(frame: CGRect())
        
        addSubview(desc)
        addSubview(image)
        addSubview(question)
        answers = getAnswersView(answers: step.answers)
        addSubview(answers)
        
        constrain(self, desc, image, question, answers) { (view, desc, image, question, answers) in
            desc.leading == view.leading + 16
            desc.trailing == view.trailing - 16
            image.leading == view.leading + 16
            image.trailing == view.trailing - 16
            question.leading == view.leading + 16
            question.trailing == view.trailing - 16
            answers.leading == view.leading + 16
            answers.trailing == view.trailing - 16
            
            desc.top == view.top + 16
            image.top == desc.bottom + 16
            question.top == image.bottom + 16
            answers.top == question.bottom + 16
            answers.bottom == view.bottom - 16
            
        }
        
        desc.text = step.desc
        question.text = step.question
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
