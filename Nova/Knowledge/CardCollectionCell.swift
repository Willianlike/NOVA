//
//  CardCollectionCell.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

class CardCollectionCell: UICollectionViewCell, ReusableView {
    
    var desc: UILabel = {
        let l = UILabel()
        l.textColor = .lightGray
        l.numberOfLines = 0
        return l
    }()
    var name: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.numberOfLines = 0
        return l
    }()
    var stack: UIStackView = {
        let l = UIStackView()
        l.axis = .vertical
        l.alignment = .leading
        l.distribution = .equalSpacing
        return l
    }()
    var image: UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        return l
    }()
    var content: UIView = {
        let l = UIView()
        l.backgroundColor = .white
        return l
    }()
    var littleStar: UIImageView = {
        let l = UIImageView(image: UIImage(named: "littleStar"))
        l.contentMode = .scaleAspectFill
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.content.clipsToBounds = true
        self.content.layer.cornerRadius = 16
        self.backgroundColor = .clear
        content.backgroundColor = .white
        clipsToBounds = false
        contentView.addSubview(content)
        contentView.addSubview(littleStar)
        content.addSubview(image)
        content.addSubview(stack)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(desc)
        
        constrain(contentView, content, stack, name, desc, littleStar, image) { (view, content, stack, name, desc, littleStar, image) in
            content.edges == view.edges
            
            image.centerY == content.centerY
            image.height == image.width
            image.width == content.width * 0.17
            image.leading == content.leading + 16
            
            stack.leading == image.trailing + 16
            stack.top == content.top + 16
            stack.bottom == content.bottom - 16
            stack.trailing == content.trailing - 16
            
            littleStar.width == 25
            littleStar.height == 25
            littleStar.leading == view.leading + 8
            littleStar.top == view.top - 10
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: KnowledgeModel) {
        image.image = model.image
        desc.text = model.description
        name.text = model.name
        littleStar.isHidden = model.startHidden
        name.font = model.firstFont
        desc.font = model.secondFont
    }
    
    func configure(model: ToolModel) {
        image.image = model.image
        desc.text = model.description
        name.text = model.name
        littleStar.isHidden = model.startHidden
        name.font = model.firstFont
        desc.font = model.secondFont
    }
}
