
//
//  ToolsVC.swift
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

class ToolsVC: UIViewController {
    
    let vm: ToolsVM
    
    let collectionView: ToolsCollectionView
    let topBar: VCNavigation = VCNavigation()
    
    init() {
        vm = ToolsVM()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = ToolsCollectionView(cards: vm.cards, frame: CGRect(), collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var tabItem: UITabBarItem {
        return UITabBarItem(title: loc.tr("Tools"), image: UIImage(named: "toolsTab"), tag: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupVM()
    }
    
    func setupUI() {
        view.addSubview(topBar)
        view.addSubview(collectionView)
        constrain(view, topBar, collectionView) { (view, bar, collection) in
            bar.top == view.top
            bar.leading == view.leading
            bar.trailing == view.trailing
            bar.height == 100
            
            collection.top == bar.bottom
            collection.leading == view.leading
            collection.trailing == view.trailing
            collection.bottom == view.bottom
        }
    }
    
    func setupVM() {
        
    }
    
}
