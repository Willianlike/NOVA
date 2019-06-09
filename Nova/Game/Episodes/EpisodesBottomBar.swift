//
//  EpisodesBottomBar.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import MBCircularProgressBar
import Cartography

class EpisodesBottomBar: UIView {
    
    static let needHeight: CGFloat = 135
    
    let stack: UIStackView = {
        let l = UIStackView()
        l.alignment = .center
        l.axis = .horizontal
        l.distribution = .equalSpacing
        return l
    }()
    
    var spacerView: UIView {
        let l = UIView()
        constrain(l, block: { (l) in
            l.width == 1
        })
        return l
    }
    
    init(params: [Variable<Param>]) {
        super.init(frame: CGRect())
        
        addSubview(stack)
        
        stack.addArrangedSubview(spacerView)
        for param in params {
            let view = ParamView(param: param)
            stack.addArrangedSubview(view)
        }
        stack.addArrangedSubview(spacerView)
        
        constrain(stack, self) { (stack, view) in
            stack.edges == view.edges
        }
        
        backgroundColor = .white
        
        addBorders(edges: .top, color: UIColor.black.withAlphaComponent(0.3), inset: 0, thickness: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ParamView: UIView {
    
    let circle: MBCircularProgressBarView = {
        let l = MBCircularProgressBarView()
        l.maxValue = 100
        l.progressAngle = 100
        l.progressLineWidth = 15
        l.emptyLineWidth = 15
        l.progressCapType = 0
        l.emptyLineColor = UIColor.black.withAlphaComponent(0.1)
        l.backgroundColor = .clear
        l.valueFontSize = 16
        l.showUnitString = false
        l.emptyLineStrokeColor = .clear
        l.progressStrokeColor = .clear
        return l
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        l.textAlignment = .center
        return l
    }()
    
    let disposeBag = DisposeBag()
    
    init(param: Variable<Param>) {
        super.init(frame: CGRect())
        
        addSubview(title)
        addSubview(circle)
        constrain(self, title, circle) { (view, title, circle) in
            title.top == view.top
            title.leading == view.leading
            title.trailing == view.trailing
            
            circle.top == title.bottom
            circle.leading >= view.leading
            circle.trailing <= view.trailing
            circle.width == 90
            circle.height == 90
            circle.centerX == view.centerX
            circle.bottom == view.bottom - 8
            
        }
        
        self.circle.progressColor = param.value.color
        self.circle.fontColor = param.value.color
        self.title.textColor = param.value.color
        title.text = param.value.name
        param.asObservable().observeOn(MainScheduler.asyncInstance).subscribe(onNext: { [unowned self] param in
            UIView.animate(withDuration: 0.3, animations: {
                self.circle.value = CGFloat(param.value)
            })
        }).disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
