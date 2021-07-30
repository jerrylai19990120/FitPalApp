//
//  FPPersonalActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPPersonalActivitiesViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var searchField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Activities"
        
        let searchBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = searchBtn
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(FPActivityCell.self, forCellWithReuseIdentifier: FPActivityCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            
        })
    }
}
