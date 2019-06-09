//
//  GamePathVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Cartography

class GameVC: BaseVC {
    
    let vm: GameVM
    let table: GameTableView
    let profileView = GameProfileView()
    let energyBar = EnergyBar()
    
    let topContainer: UIView = {
        let l = UIView()
        l.backgroundColor = .blueBase
        let k = UIView()
        k.backgroundColor = .blueBase
        let g = GradientView()
        l.addSubview(g)
        l.addSubview(k)
        constrain(l, g, k, block: { (l, g, k) in
            g.leading == l.leading
            g.top == l.bottom
            g.trailing == l.trailing
            g.height == UIScreen.main.bounds.width / 5
            
            k.leading == l.leading
            k.bottom == l.top
            k.trailing == l.trailing
            k.height == VCNavigation.topHeight
        })
        g.startColor = .blueBase
        
        g.endColor = UIColor.blueBase.withAlphaComponent(0)
        return l
    }()
    
    let startBtn: UIButton = {
        let l = UIButton(type: .system)
        l.backgroundColor = .white
        l.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        l.clipsToBounds = true
        l.layer.cornerRadius = UIScreen.main.bounds.width / 8
        l.setTitleColor(.orangeBase, for: .normal)
        l.setTitle("Начать игру", for: .normal)
        return l
    }()
    
    init() {
        vm = GameVM()
        
        table = GameTableView(steps: vm.steps)
        super.init(nibName: nil, bundle: nil)
        tabBarItem = GameVC.tabItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Game"), image: UIImage(named: "gameTab"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(table)
        view.addSubview(topContainer)
        view.addSubview(startBtn)
        
        topContainer.addSubview(profileView)
        topContainer.addSubview(energyBar)
        
        constrain(view, table, profileView, topContainer, energyBar, startBtn) { (view, table, profileView, topContainer, energyBar, startBtn) in
            table.edges == view.edges
            
            startBtn.leading == view.leading + 16
            startBtn.trailing == view.trailing - 16
            startBtn.bottom == view.bottom - 16 - (tabBarController?.tabBar.frame.height ?? 0)
            startBtn.height == UIScreen.main.bounds.width / 4
            
            topContainer.top == view.top + VCNavigation.topHeight
            topContainer.leading == view.leading
            topContainer.trailing == view.trailing
            topContainer.height == 44
            
            profileView.leading == topContainer.leading + 16
            profileView.top == topContainer.top
            profileView.bottom == topContainer.bottom
            profileView.trailing == energyBar.leading
            
            energyBar.trailing == topContainer.trailing - 16
            energyBar.width == 44
            energyBar.height == 44
            energyBar.centerY == topContainer.centerY
        }
        table.transform = CGAffineTransform(rotationAngle: (-.pi))
        table.contentInset = UIEdgeInsets(top: 60 + UIScreen.main.bounds.width / 4, left: 0, bottom: 56, right: 0)
        table.setContentOffset(.zero, animated: false)
        table.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: table.bounds.size.width - 10)
        
        profileView.name.text = "Vanya"
        profileView.progress = 5
        startBtn.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            let vc = EpisodeVC(episode: episodesVal.value[0].episode)
            self.present(NavigationVC(rootViewController: vc), animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
}
