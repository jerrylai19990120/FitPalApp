//
//  FPMineInfoViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit

class FPMineInfoViewController: UIViewController {
    
    var friendBtn: UIBarButtonItem?
    var settingsBtn: UIBarButtonItem?
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "You"
        
        friendBtn = UIBarButtonItem(image: UIImage(systemName: "person.2"), style: .plain, target: self, action: nil)
        settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = friendBtn
        self.navigationItem.rightBarButtonItem = settingsBtn
        
        let topBar = FPMineCenterTopBar()
        self.view.addSubview(topBar)
        topBar.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(60)
        }
        
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(topBar.mas_bottom)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
        
    }
    
}
