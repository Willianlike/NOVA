//
//  SettingsVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Cartography

class ScrollVC: BaseVC {
    
    
    let scroll: UIScrollView = {
        let v = UIScrollView()
        return v
    }()
    
    let image: UIImageView = {
        let v = UIImageView(image: UIImage(named: "settingsScreen"))
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scroll)
        scroll.addSubview(image)
        constrain(image, scroll, view) { (image, scroll, view) in
            image.edges == scroll.edges
            scroll.edges == view.edges
            image.width == scroll.width
        }
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        btn.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        view.addSubview(btn)
    }
    
}

class SettingsVC: BaseVC {
    
    let leftBtn : UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(named: "pencil"), for: .normal)
        b.setTitle(loc.tr("Change"), for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        b.tintColor = .white
        return b
    }()
    
    let energyBar: EnergyBar = {
        let v = EnergyBar()
        return v
    }()
    
    let profileImage: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    let profilename: UILabel = {
        let v = UILabel()
        return v
    }()
    
    let content: UIView = {
        let v = UIView()
        return v
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tabBarItem = SettingsVC.tabItem
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Settings"), image: UIImage(named: "settingsTab"), tag: 3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        content.addSubview(leftBtn)
        content.addSubview(energyBar)
        content.addSubview(profilename)
        content.addSubview(profileImage)

        constrain(view, content, leftBtn, energyBar) { (view, content, leftBtn, energyBar) in
            leftBtn.leading == content.leading + 16
            leftBtn.top == content.top
            leftBtn.height == 44

            energyBar.top == content.top
            energyBar.trailing == content.trailing - 16
            energyBar.height == 44
            energyBar.width == 44




            content.edges == inset(view.edges, VCNavigation.topHeight, 0, 0, 0)
        }
    }
    
}
