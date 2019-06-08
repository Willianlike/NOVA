//
//  GameProfileView.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class GameProfileView: UIView {
    
    let image: UIImageView = {
        let l = UIImageView(image: UIImage(named: "ava"))
        l.contentMode = .scaleAspectFit
        return l
    }()
    let stack: UIStackView = {
        let l = UIStackView()
        l.alignment = .leading
        l.axis = .vertical
        l.distribution = .equalSpacing
        return l
    }()
    let name: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        l.textColor = .white
        return l
    }()
    let progressLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        l.textColor = .white
        return l
    }()
    var spacerView: UIView {
        let l = UIView()
        constrain(l, block: { (l) in
            l.height == 1
        })
        return l
    }
    
    var progress: Int = 5 {
        didSet {
            progressLabel.text = "Прогресс \(progress)%"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack.addArrangedSubview(spacerView)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(progressLabel)
        stack.addArrangedSubview(spacerView)
        self.addSubview(image)
        self.addSubview(stack)
        constrain(self, image, stack) { (view, image, stack) in
            image.top == view.top
            image.leading == view.leading
            image.bottom == view.bottom
            image.width == image.height
            
            stack.leading == image.trailing + 16
            stack.top == view.top
            stack.bottom == view.bottom
            stack.trailing == view.trailing
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

