//
//  BaseVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography
import RxSwift

class BaseVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let backView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "beautyBackground"))
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backView)
        constrain(view, backView) { (view, backView) in
            backView.edges == view.edges
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        energyVal.value -= 5
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
