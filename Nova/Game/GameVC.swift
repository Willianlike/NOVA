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
        l.setTitle("Играть", for: .normal)
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
        
        backView.image = UIImage(named: "mapBack")
        
        let arc = UIImageView(image: UIImage(named: "weather"))
        arc.frame = CGRect(x: view.bounds.width / 2, y: 100, width: view.bounds.width / 2 - 16, height: (view.bounds.width / 2 - 16)/3.3)
        view.addSubview(arc)
        arc.contentMode = .scaleAspectFit
        let labl = UILabel(frame: CGRect(x:  16,
                                   y: 0,
                                   width: arc.bounds.width,
                                   height: arc.bounds.height))
        labl.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        labl.text = "-12"
        labl.textColor = .white
        arc.addSubview(labl)
        arcticTemp.asObservable().map { "\(Int($0))"}.bind(to: labl.rx.text).disposed(by: disposeBag)
        
        vm.steps.asObservable().map { (models) in
            if models.count == 0 {
                return 0
            }
            return Int(Float(models.filter({ $0.episode.passed }).count) / Float(models.count) * 100)
            }.subscribe(onNext: { [unowned self] count in
                self.profileView.progress = count
            }).disposed(by: disposeBag)
        
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
        
        profileView.name.text = "Вася"
        profileView.progress = 5
        startBtn.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            if let episode = episodesVal.value.first(where: { $0.episode.passed == false }) {
                self.present(episode: episode.episode)
            }
        }).disposed(by: disposeBag)
        table.rx.itemSelected.asObservable().withLatestFrom(vm.steps.asObservable()) {($0, $1)}
            .subscribe(onNext: { [unowned self] ip, steps in
                 let step = steps[ip.row]
                if !step.episode.passed {
                    self.present(episode: step.episode)
                }
            }).disposed(by: disposeBag)
    }
    
    func present(episode: EpisodeModel) {
        let vc = EpisodeVC(episode: episode)
        self.present(NavigationVC(rootViewController: vc), animated: true, completion: nil)
    }
    
}
