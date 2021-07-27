//
//  FPHomeActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit

class FPHomeActivitiesViewController: UIViewController {
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        
        //Set up activity feed
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView!.register(FPActivityCell.self, forCellWithReuseIdentifier: "ActivityCell")
        collectionView!.backgroundColor = DefaultLightGray
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
    
        
    }

}
