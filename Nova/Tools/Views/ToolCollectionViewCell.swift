//
//  ToolCollectionViewCell.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit

class ToolCollectionViewCell: UICollectionViewCell, ReusableView {

    @IBOutlet weak var littleStar: UIImageView!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.content.clipsToBounds = true
        self.content.layer.cornerRadius = 16
        self.backgroundColor = .clear
        content.backgroundColor = .white
        clipsToBounds = false
    }
    
    func configure(model: ToolModel) {
        image.image = model.image
        desc.text = model.description
        name.text = model.name
        littleStar.isHidden = model.startHidden
    }

}
