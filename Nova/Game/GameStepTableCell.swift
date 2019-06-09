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
    static let cellH: CGFloat = UIScreen.main.bounds.width / 4
    static let pointH: CGFloat = UIScreen.main.bounds.width / 4
}

class GameStepTableCellLeft: BaseGameCell, ReusableView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pathImage)
        contentView.addSubview(pointImage)
        contentView.addSubview(label)
        contentView.addSubview(energy)
        constrain(contentView, pathImage, pointImage, label, energy) { (view, pathImage, pointImage, label, energy) in
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
            
            energy.leading == label.leading
            energy.bottom == label.top - 10
        }
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configure(model: GameStepModel) {
//        switch model.stepType {
//        case .highlighted:
//            pointImage.image = UIImage(named: "stepPassed")
//            pathImage.image = UIImage(named: "leftToRightHigh")
//        case .blocked:
//            pointImage.image = UIImage(named: "stepBlocked")
//            pathImage.image = UIImage(named: "leftToRightDef")
//        case .passed:
//            pointImage.image = UIImage(named: "stepPassed")
//            pathImage.image = UIImage(named: "leftToRightHigh")
//        }
        label.text = model.episode.name
        energy.isHidden = model.episode.passed
        pathImage.image = model.episode.passed == true ? UIImage(named: "leftToRightHigh") : UIImage(named: "leftToRightDef")
        pointImage.image = model.episode.passed == true ? UIImage(named: "stepPassed") : UIImage(named: "stepBlocked")
        energy.text = "\(model.episode.energy)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class BaseGameCell: UITableViewCell {
    
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
    
    let energy: UILabel =  {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        v.textColor = .white
        let l = UIImageView(image: UIImage(named: "lighting"))
        v.addSubview(l)
        constrain(v, l, block: { (v, l) in
            l.trailing == v.leading - 4
            l.centerY == v.centerY
        })
        return v
    }()
}


class GameStepTableCellRight: BaseGameCell, ReusableView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pathImage)
        contentView.addSubview(pointImage)
        contentView.addSubview(label)
        contentView.addSubview(energy)
        constrain(contentView, pathImage, pointImage, label, energy) { (view, pathImage, pointImage, label, energy) in
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
            
            energy.trailing == label.trailing
            energy.bottom == label.top - 10
        }
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    func configure(model: GameStepModel) {
        label.text = model.episode.name
        energy.isHidden = model.episode.passed
        pathImage.image = model.episode.passed == true ? UIImage(named: "rightToLeftHigh") : UIImage(named: "rightToLeftDef")
        pointImage.image = model.episode.passed == true ? UIImage(named: "stepPassed") : UIImage(named: "stepBlocked")
        energy.text = "\(model.episode.energy)"
//        switch model.stepType {
//        case .highlighted:
//            pointImage.image = UIImage(named: "stepPassed")
//            pathImage.image = UIImage(named: "rightToLeftHigh")
//        case .blocked:
//            pointImage.image = UIImage(named: "stepBlocked")
//            pathImage.image = UIImage(named: "rightToLeftDef")
//        case .passed:
//            pointImage.image = UIImage(named: "stepPassed")
//            pathImage.image = UIImage(named: "rightToLeftHigh")
//        }
//        label.text = model.identity
//        energy.isHidden = model.energy == nil
//        if let ene = model.energy {
//            energy.text = "\(ene)"
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
