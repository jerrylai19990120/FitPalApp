//
//  FPHomeActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit

class FPHomeActivitiesViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var friendBtn: UIBarButtonItem?
    var addBtn: UIBarButtonItem?
    var settingsBtn: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        
        addBtn = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: nil)
        friendBtn = UIBarButtonItem(image: UIImage(systemName: "person.2"), style: .plain, target: self, action: #selector(friendBtnClicked))
        settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsBtnClicked))
        
        self.navigationItem.leftBarButtonItems = [addBtn!, friendBtn!]
        self.navigationItem.rightBarButtonItem = settingsBtn!
        
        //Set up activity feed
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView!.register(FPActivityCell.self, forCellWithReuseIdentifier: "ActivityCell")
        collectionView!.backgroundColor = DefaultLightGray
        collectionView?.showsVerticalScrollIndicator = false
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
    
    @objc func friendBtnClicked() {
        self.navigationController?.pushViewController(FPAddFriendsViewController(), animated: true)
    }
    
    @objc func settingsBtnClicked() {
        self.navigationController?.pushViewController(FPSettingsViewController(), animated: true)
    }

}
