//
//  EnergyBar.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

@IBDesignable
class EnergyBar: UIView {
    
    var energy: Int = 100 {
        didSet {
            label.text = "\(energy)"
        }
    }
    
    
    var label: UILabel! = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var background: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    private func didLoad() {
        self.addSubview(background)
        self.addSubview(label)
        label.text = "\(energy)"
        
        constrain(self, label, background) { view, label, back in
            back.edges == view.edges
            label.edges == view.edges
        }
    }
    
}

