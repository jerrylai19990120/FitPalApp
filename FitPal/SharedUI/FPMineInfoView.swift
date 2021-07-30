//
//  FPMineInfoView.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import UIKit

class FPMineInfoView: UIView {
    
    var collectionView: UICollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(FPProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        collectionView?.register(FPWeeklyStatusCell.self, forCellWithReuseIdentifier: "WeeklyStatusCell")
        collectionView?.register(FPStatusCell.self, forCellWithReuseIdentifier: "StatusCell")
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultLightGray
        self.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self)
            make?.left.equalTo()(self)
            make?.right.equalTo()(self)
            make?.bottom.equalTo()(self)
        })
    }

}
