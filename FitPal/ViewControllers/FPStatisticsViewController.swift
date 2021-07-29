//
//  FPStatisticsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPStatisticsViewController: UIViewController {
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Statistics"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = DefaultLightGray
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(FPAvgStatCell.self, forCellWithReuseIdentifier: "AvgStatCell")
        collectionView?.register(FPYearlyStatCell.self, forCellWithReuseIdentifier: "YearlyStatCell")
        collectionView?.register(FPAllTimeStatCell.self, forCellWithReuseIdentifier: "AllTimeStatCell")
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
        
    }

}
