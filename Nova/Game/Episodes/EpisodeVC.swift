//
//  EpisodeVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import Cartography

class EpisodeVC: BaseVC {
    
    let topBar = EpisodeTopBar()
    let episodeContent: EpisodeContent
    let episode: EpisodeModel
    
    init(episode: EpisodeModel) {
        self.episode = episode
        episodeContent = EpisodeContent()
        super.init(nibName: nil, bundle: nil)
        
        episodeContent.views = episode.steps.map({ [unowned self] (step) in
            return self.getView(for: step)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(episodeContent)
        view.addSubview(topBar)
        constrain(view, topBar, episodeContent) { (view, topBar, scroll) in
            scroll.leading == view.leading
            scroll.trailing == view.trailing
            topBar.leading == view.leading
            topBar.trailing == view.trailing
            
            topBar.top == view.top
            topBar.height == EpisodeTopBar.needHeight
            scroll.top == topBar.bottom
            scroll.bottom == view.bottom
        }
        
        topBar.title.text = episode.name
        
        topBar.backBtn.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getView(for step: StepModel) -> UIView {
        let scroll = UIScrollView()
        let view = EpisodeStepView(step: step)
        view.answerClick.asObservable().subscribe(onNext: { [unowned self] answer in
            self.episodeContent.scrollToNext()
        }).disposed(by: disposeBag)
        scroll.addSubview(view)
        constrain(view, scroll) { (view, scroll) in
            view.edges == scroll.edges
            view.width == UIScreen.main.bounds.width
        }
        return scroll
    }
    
}
