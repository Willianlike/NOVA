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
    let bottomBar: EpisodesBottomBar
    let episodeContent: EpisodeContent
    let episode: EpisodeModel
    
    var nowStep: Int = 1
    
    init(episode: EpisodeModel) {
        self.episode = episode
        episodeContent = EpisodeContent()
        
        bottomBar = EpisodesBottomBar(params: paramsVal.value)
        
        super.init(nibName: nil, bundle: nil)
        
        episodeContent.views = episode.steps.map({ [unowned self] (step) in
            return self.getView(for: step)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(episodeContent)
        view.addSubview(topBar)
        view.addSubview(bottomBar)
        constrain(view, topBar, episodeContent, bottomBar) { (view, topBar, scroll, bottomBar) in
            scroll.leading == view.leading
            scroll.trailing == view.trailing
            topBar.leading == view.leading
            topBar.trailing == view.trailing
            bottomBar.leading == view.leading
            bottomBar.trailing == view.trailing
            
            topBar.top == view.top
            topBar.height == EpisodeTopBar.needHeight
            bottomBar.bottom == view.bottom
            bottomBar.height == EpisodesBottomBar.needHeight
            scroll.top == topBar.bottom
            scroll.bottom == bottomBar.top
            
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
            for param in answer.changeParams {
                if let val = paramsVal.value.first(where: { $0.value.name == param.name }) {
                    val.value.value += param.value
                }
            }
            self.topBar.progress.setProgress(Float(self.nowStep) / Float(self.episode.steps.count), animated: true)
            self.nowStep += 1
        }).disposed(by: disposeBag)
        scroll.addSubview(view)
        constrain(view, scroll) { (view, scroll) in
            view.edges == scroll.edges
            view.width == UIScreen.main.bounds.width
        }
        return scroll
    }
    
}
