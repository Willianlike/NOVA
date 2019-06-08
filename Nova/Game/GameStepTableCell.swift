//
//  GameStepTableCell.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Cartography

struct GameStepTableCellParams {
    static let cellH: CGFloat = 100
    static let pointH: CGFloat = 100
}

class GameStepTableCellLeft: UITableViewCell, ReusableView {
    
    let pathImage: UIImageView =  {
        let v = UIImageView()
        return v
    }()
    
    let pointImage: UIImageView =  {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let label: UILabel =  {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        v.textColor = .white
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pathImage)
        contentView.addSubview(pointImage)
        contentView.addSubview(label)
        constrain(contentView, pathImage, pointImage, label) { (view, pathImage, pointImage, label) in
            pathImage.top == view.top - (GameStepTableCellParams.cellH / 2)
            pathImage.bottom == view.bottom - (GameStepTableCellParams.cellH / 2)
            pathImage.centerX == view.centerX
            pathImage.width == view.width / 1.5
            
            pointImage.centerX == pathImage.leading + 8
            pointImage.height == GameStepTableCellParams.pointH
            pointImage.width == pointImage.height
            pointImage.bottom == view.bottom + 16
            
            label.leading == pointImage.trailing
            label.centerY == pointImage.centerY - 8
        }
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configure(model: GameStepModel) {
        switch model.stepType {
        case .highlighted:
            pointImage.image = UIImage(named: "stepPassed")
            pathImage.image = UIImage(named: "leftToRightHigh")
        case .blocked:
            pointImage.image = UIImage(named: "stepBlocked")
            pathImage.image = UIImage(named: "leftToRightDef")
        case .passed:
            pointImage.image = UIImage(named: "stepPassed")
            pathImage.image = UIImage(named: "leftToRightHigh")
        }
        label.text = model.identity
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class GameStepTableCellRight: UITableViewCell, ReusableView {
    
    let pathImage: UIImageView =  {
        let v = UIImageView()
        return v
    }()
    
    let pointImage: UIImageView =  {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    let label: UILabel =  {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        v.textColor = .white
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pathImage)
        contentView.addSubview(pointImage)
        contentView.addSubview(label)
        constrain(contentView, pathImage, pointImage, label) { (view, pathImage, pointImage, label) in
            pathImage.top == view.top - (GameStepTableCellParams.cellH / 2)
            pathImage.bottom == view.bottom - (GameStepTableCellParams.cellH / 2)
            pathImage.centerX == view.centerX
            pathImage.width == view.width / 1.5
            
            pointImage.centerX == pathImage.trailing - 8
            pointImage.height == GameStepTableCellParams.pointH
            pointImage.width == pointImage.height
            pointImage.bottom == view.bottom + 16
            
            label.trailing == pointImage.leading
            label.centerY == pointImage.centerY - 8
        }
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configure(model: GameStepModel) {
        switch model.stepType {
        case .highlighted:
            pointImage.image = UIImage(named: "stepPassed")
            pathImage.image = UIImage(named: "rightToLeftHigh")
        case .blocked:
            pointImage.image = UIImage(named: "stepBlocked")
            pathImage.image = UIImage(named: "rightToLeftDef")
        case .passed:
            pointImage.image = UIImage(named: "stepPassed")
            pathImage.image = UIImage(named: "rightToLeftHigh")
        }
        label.text = model.identity
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
