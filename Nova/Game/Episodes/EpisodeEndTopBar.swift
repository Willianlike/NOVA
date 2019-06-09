//
//  EpisodeEndTopBar.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class EpisodeEndTopBar: UIView {
    
    static let needHeight: CGFloat = VCNavigation.neededHeight
    
    let closeBtn: UIButton = {
        let l = UIButton()
        l.setImage(UIImage(named: "cross"), for: .normal)
        return l
    }()
    
    let title: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    let content: UIView = {
        let l = UIView()
        l.backgroundColor = .clear
        return l
    }()
    
    let desc: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    let pointsImage: UIImageView = {
        let l = UIImageView(image: UIImage(named: "congratsTop"))
        l.contentMode = .scaleAspectFit
        constrain(l) { $0.width == UIScreen.main.bounds.width / 1.5}
        return l
    }()
    
    init(episode: EpisodeModel) {
        super.init(frame: CGRect())
        
        addSubview(content)
        content.addSubview(closeBtn)
        content.addSubview(title)
        content.addSubview(desc)
        content.addSubview(pointsImage)
        
        constrain(closeBtn, self, title, content, desc, pointsImage) { (closeBtn, view, title, content, desc, pointsImage) in
            content.top == view.top + VCNavigation.topHeight
            content.leading == view.leading
            content.trailing == view.trailing
            content.bottom == view.bottom
            
            closeBtn.top == content.top
            closeBtn.trailing == content.trailing - 16
            closeBtn.height == 44
            closeBtn.width == closeBtn.height
            
            title.leading == content.leading + 16
            title.trailing == content.trailing - 16
            title.top == content.top
            title.height == 44
            
            desc.top == title.bottom + 16
            desc.leading == content.leading + 16
            desc.trailing == content.trailing - 16
            
            pointsImage.top == desc.bottom + 16
            pointsImage.centerX == content.centerX
        }
        
        title.text = "Поздравляем!"
        desc.text = "Вы успешно завершили этап \(episode.name)"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
