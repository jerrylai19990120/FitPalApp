//
//  FPSettingsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPSettingsViewController: UIViewController {
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addObservers()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Settings"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultLightGray
        collectionView?.register(FPSettingsCell.self, forCellWithReuseIdentifier: FPSettingsCell.identifier)
        collectionView?.register(FPLogOutCell.self, forCellWithReuseIdentifier: FPLogOutCell.identifier)
        collectionView?.register(FPHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FPHeaderCollectionView.identifier)
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(changePasswordHandler(notif:)), name: NSNotification.Name("ChangePasswordClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeEmailHandler(notif:)), name: NSNotification.Name("ChangeEmailClicked"), object: nil)
    }
    
    @objc func changePasswordHandler(notif: Notification) {
        self.navigationController?.pushViewController(FPChangePasswordViewController(), animated: true)
    }
    
    @objc func changeEmailHandler(notif: Notification) {
        self.navigationController?.pushViewController(FPChangeEmailViewController(), animated: true)
    }

}
