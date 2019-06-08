//
//  ToolCollectionViewCell.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit

class ToolCollectionViewCell: UICollectionViewCell, ReusableView {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stack: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: ToolModel) {
        image.image = model.image
        desc.text = model.description
        name.text = model.name
    }

}
