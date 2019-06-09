//
//  EpisodeEndVC.swift
//  Nova
//
//  Created by Вильян Яумбаев on 09/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Cartography

class TitleCollectionViewCell: UICollectionViewCell, ReusableView {
    var title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        title.textColor = .darkGray
        constrain(title, self) { $0.edges == inset($1.edges, 16) }
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EpisodeEndVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? episode.regardsTools.count + 1 : episode.regardsKnowledge.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionCell.reuseIdentifier, for: indexPath) as! CardCollectionCell
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cel = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.reuseIdentifier, for: indexPath) as! TitleCollectionViewCell
                cel.title.text = "Tools"
                return cel
            }
            cell.configure(model: episode.regardsTools[indexPath.row - 1])
        } else {
            if indexPath.row == 0 {
                let cel = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.reuseIdentifier, for: indexPath) as! TitleCollectionViewCell
                cel.title.text = "Knowledge"
                return cel
            }
            cell.configure(model: episode.regardsKnowledge[indexPath.row - 1])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return CGSize(width: UIScreen.main.bounds.width - 32, height: 70)
            }
            return episode.regardsTools[indexPath.row - 1].getSize()
        } else {
            if indexPath.row == 0 {
                return CGSize(width: UIScreen.main.bounds.width - 32, height: 70)
            }
            return episode.regardsKnowledge[indexPath.row - 1].getSize()
        }
    }
    
    
    let topBar: EpisodeEndTopBar
    let collection: UICollectionView = {
        let ll = UICollectionViewFlowLayout()
        ll.scrollDirection = .vertical
        ll.minimumInteritemSpacing = 16
        ll.minimumLineSpacing = 16
        ll.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let l = UICollectionView(frame: CGRect(), collectionViewLayout: ll)
        l.register(CardCollectionCell.self, forCellWithReuseIdentifier: CardCollectionCell.reuseIdentifier)
        l.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.reuseIdentifier)
        l.backgroundColor = .white
        return l
    }()
    
    let episode: EpisodeModel
    
    init(episode: EpisodeModel) {
        self.episode = episode
        topBar = EpisodeEndTopBar(episode: episode)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topBar)
        topBar.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        collection.reloadData()
        constrain(view, topBar, topBar.pointsImage, collection) { (view, top, img, collection) in
            top.edges == view.edges
            collection.top == img.bottom
            collection.leading == top.leading
            collection.trailing == top.trailing
            collection.bottom == top.bottom
        }
        
        topBar.closeBtn.rx.tap.asObservable().subscribe(onNext: { [unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        backView.image = UIImage(named: "background")
        
    }
    
}
