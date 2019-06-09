//
//  EpisodeContent.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class EpisodeContent: UIScrollView {
    
    var views = [UIView]() {
        didSet {
            viewsUpdated()
        }
    }
    
    let content = UIView()
    
    weak var host: EpisodeVC?
    
    init(views: [UIView]) {
        super.init(frame: CGRect())
        didLoad()
        self.views = views
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad() {
        isDirectionalLockEnabled = true
        addSubview(content)
        constrain(self, content) { $1.edges == $0.edges
            $1.height == UIScreen.main.bounds.height - EpisodeTopBar.needHeight - EpisodesBottomBar.needHeight }
        isScrollEnabled = false
        backgroundColor = .white
    }
    
    func scrollToNext() {
        if contentOffset.x + UIScreen.main.bounds.width * 2 <= contentSize.width {
            setContentOffset(CGPoint(x: contentOffset.x + UIScreen.main.bounds.width, y: 0), animated: true)
        } else {
            if let ep = host?.episode {
                host?.navigationController?.pushViewController(EpisodeEndVC(episode: ep), animated: true)
            }
        }
    }
    
    func viewsUpdated() {
        for view in content.subviews {
            view.removeFromSuperview()
        }
        let perView: CGFloat = UIScreen.main.bounds.width
        var lastView: UIView? = nil
        for view in views {
            content.addSubview(view)
            
            if let lastView = lastView {
                constrain(lastView, view) { (lastView, view) in
                    view.leading == lastView.trailing
                }
            } else {
                constrain(content, view) { (content, view) in
                    view.leading == content.leading
                }
            }
            constrain(content, view) { (content, view) in
                view.top == content.top
                view.bottom == content.bottom
                view.width == perView
            }
            
            lastView = view
        }
        if let lastView = lastView {
            constrain(lastView, content) { (lastView, content) in
                lastView.trailing == content.trailing
            }
        }
    }
    
}
