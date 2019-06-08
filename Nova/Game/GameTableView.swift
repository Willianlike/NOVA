//
//  GameTableView.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class GameTableView: UITableView {
    
    let steps: Variable<[GameStepModel]>
    
    let disposeBag = DisposeBag()
    
    init(steps: Variable<[GameStepModel]>) {
        self.steps = steps
        super.init(frame: CGRect(), style: .plain)
        
        rowHeight = GameStepTableCellParams.cellH
        backgroundColor = .clear
        separatorColor = .clear
        register(GameStepTableCellLeft.self, forCellReuseIdentifier: GameStepTableCellLeft.reuseIdentifier)
        register(GameStepTableCellRight.self, forCellReuseIdentifier: GameStepTableCellRight.reuseIdentifier)
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, GameStepModel>>(configureCell: { dataSource, tableView, indexPath, model in
            switch model.position {
            case .left:
                let cell = tableView.dequeueReusableCell(withIdentifier: GameStepTableCellLeft.reuseIdentifier,
                                                         for: indexPath) as! GameStepTableCellLeft
                cell.configure(model: model)
                cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                return cell
            case .right:
                let cell = tableView.dequeueReusableCell(withIdentifier: GameStepTableCellRight.reuseIdentifier,
                                                         for: indexPath) as! GameStepTableCellRight
                cell.configure(model: model)
                cell.transform = CGAffineTransform(rotationAngle: (-.pi))
                return cell
            }
        })
        
        steps.asObservable()
            .map { [SectionModel(model: "Hello", items: $0)] }
            .bind(to: rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
