//
//  FPPersonalActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPPersonalActivitiesViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var searchField: FPTextField?

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
        
        searchField = FPTextField()
        searchField?.clearButtonMode = .whileEditing
        searchField?.adjustsFontSizeToFitWidth = true
        searchField?.placeholder = "Search by title"
        searchField?.backgroundColor = DefaultLightGray
        searchField?.borderStyle = .none
        searchField?.layer.cornerRadius = 12
        searchField?.clipsToBounds = true
        let icon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = DefaultTabColor
        searchField?.leftView = icon
        searchField?.leftViewMode = .always
        
        self.view.addSubview(searchField!)
        searchField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.view)?.offset()(16)
            make?.right.equalTo()(self.view)?.offset()(-16)
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! + 10)
            make?.height.equalTo()(40)
        })
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(FPActivityCell.self, forCellWithReuseIdentifier: FPActivityCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultLightGray
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(searchField?.mas_bottom)?.offset()(10)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
    }
}
