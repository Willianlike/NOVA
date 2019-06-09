//
//  KnowledgeVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import Cartography

class KnowledgeVC: BaseVC {
    
    let vm: KnowledgeVM
    
    let collectionView: KnowledgeCollectionView
    let topBar: VCNavigation = VCNavigation()
    let controlBar: SegmentedControl = SegmentedControl()
    
    init() {
        vm = KnowledgeVM()
        
        collectionView = KnowledgeCollectionView(cards: vm.cards, frame: CGRect(), collectionViewLayout: KnowledgeCollectionView.layout)
        
        super.init(nibName: nil, bundle: nil)
        tabBarItem = KnowledgeVC.tabItem
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Knowledge book"), image: UIImage(named: "knowledgeBookTab"), tag: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVM()
    }
    
    func setupUI() {
        view.addSubview(topBar)
        view.addSubview(controlBar)
        view.addSubview(collectionView)
        constrain(view, topBar, controlBar, collectionView) { (view, bar, controlBar, collection) in
            bar.top == view.top
            bar.leading == view.leading
            bar.trailing == view.trailing
            bar.height == VCNavigation.neededHeight
            
            controlBar.top == bar.bottom
            controlBar.leading == view.leading
            controlBar.trailing == view.trailing
            controlBar.height == 44
            
            collection.top == controlBar.bottom
            collection.leading == view.leading
            collection.trailing == view.trailing
            collection.bottom == view.bottom
            
        }
        
        controlBar.selectorColor = UIColor.white
        controlBar.selectorTextColor = UIColor.white
        controlBar.textColor = UIColor.white.withAlphaComponent(0.7)
        controlBar.backgroundColor = .clear
        controlBar.commaSeperatedButtonTitles = loc.tr("Arctic facts") + "," + loc.tr("Game hints")
        
        topBar.title.text = loc.tr("Knowledge book")
        
        
    }
    
    func setupVM() {
        
    }
    
}
