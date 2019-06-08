//
//  ToolsCollectionView.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ToolsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    static let cellHeight: CGFloat = 90
    
    let disposeBag = DisposeBag()
    
    let cards: Variable<[ToolModel]>
    
    static var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: ToolsCollectionView.cellHeight)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return layout
    }
    
    init(cards: Variable<[ToolModel]>, frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        self.cards = cards
        super.init(frame: frame, collectionViewLayout: layout)
        
        register(UINib(nibName: "ToolCollectionViewCell", bundle: nil),
                 forCellWithReuseIdentifier: ToolCollectionViewCell.reuseIdentifier)
        
        cards.asObservable()
            .map { [AnimatableSectionModel<Int, ToolModel>(model: 0, items: $0)] }
            .bind(to: self.rx.items(dataSource: getDataSource()))
            .disposed(by: disposeBag)
        self.delegate = self
        backgroundColor = .clear
    }
    
    
    func getDataSource() -> RxCollectionViewSectionedAnimatedDataSource<AnimatableSectionModel<Int, ToolModel>> {
        return RxCollectionViewSectionedAnimatedDataSource<AnimatableSectionModel<Int, ToolModel>> (configureCell: { _, collectionView, indexPath, element in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolCollectionViewCell.reuseIdentifier,
                                                          for: indexPath) as! ToolCollectionViewCell
            cell.configure(model: element)
            return cell
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cards.value[indexPath.row].getSize()
    }
    
}
