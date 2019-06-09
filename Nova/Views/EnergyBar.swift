//
//  EnergyBar.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
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
        view.backgroundColor = UIColor.orangeBase
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    var lighting: UIImageView = {
        let v = UIImageView(image: UIImage(named: "lighting"))
        return v
    }()
    
    let disposeBag = DisposeBag()
    
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
        self.addSubview(lighting)
        label.text = "\(energy)"
        
        energyVal.asObservable().subscribe(onNext: { [unowned self] val in
            self.energy = val
        }).disposed(by: disposeBag)
        
        constrain(self, label, background, lighting) { view, label, back, lighting in
            back.edges == inset(view.edges, 8, -16, 8, 0)
            label.edges == inset(view.edges, 0, 0, 0, 0)
            lighting.leading == back.leading + 8
            lighting.centerY == back.centerY
        }
        
    }
    
}

