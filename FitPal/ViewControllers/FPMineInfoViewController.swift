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
        self.addObservers()
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(activitiesTab(notif:)), name: NSNotification.Name("ActivitiesTabClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(statisticsTab(notif:)), name: NSNotification.Name("StatisticsTabClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(settingsTab(notif:)), name: NSNotification.Name("SettingsTabClicked"), object: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "You"
        
        friendBtn = UIBarButtonItem(image: UIImage(systemName: "person.2"), style: .plain, target: self, action: #selector(friendBtnClicked))
        settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsBtnClicked))
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
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(FPProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        collectionView?.register(FPWeeklyStatusCell.self, forCellWithReuseIdentifier: "WeeklyStatusCell")
        collectionView?.register(FPStatusCell.self, forCellWithReuseIdentifier: "StatusCell")
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultLightGray
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(topBar.mas_bottom)?.offset()(3)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
    }
    
    @objc func activitiesTab(notif: NSNotification) {
        self.navigationController?.pushViewController(FPPersonalActivitiesViewController(), animated: true)
    }
    
    @objc func statisticsTab(notif: NSNotification) {
        self.navigationController?.pushViewController(FPStatisticsViewController(), animated: true)
    }
    
    @objc func settingsTab(notif: NSNotification) {
        self.navigationController?.pushViewController(FPSettingsViewController(), animated: true)
    }
    
    @objc func friendBtnClicked() {
        self.navigationController?.pushViewController(FPAddFriendsViewController(), animated: true)
    }
    
    @objc func settingsBtnClicked() {
        self.navigationController?.pushViewController(FPSettingsViewController(), animated: true)
    }
    
}


protocol FPMineInfoViewDelegate: FPMineInfoViewController {
    func navigateToMyActivities()
    func navigateToStatistics()
    func navigateToSettings()
}
