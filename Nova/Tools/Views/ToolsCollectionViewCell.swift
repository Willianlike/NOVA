//
//  ToolsCollectionViewCell.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class ToolsCollectionViewCell: UICollectionViewCell, ReusableView {
    
    let name: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        l.textColor = .black
        return l
    }()
    let descLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 15, weight: .light)
        l.textColor = .lightGray
        l.numberOfLines = 2
        return l
    }()
    let image: UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFit
        l.clipsToBounds = true
        return l
    }()
    let stack: UIStackView = {
        let l = UIStackView()
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func didLoad() {
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(descLabel)
        
        constrain(contentView, image, name, descLabel) { (view, image, name, descLabel) in
            image.centerY == view.centerY
            
        }
        
    }
    
}
