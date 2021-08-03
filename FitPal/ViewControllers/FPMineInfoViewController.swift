//
//  FPMineInfoViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit

enum FPMineInfoSelection {
    case activitiesSelection
    case profileSelection
}

class FPMineInfoViewController: UIViewController {
    
    var friendBtn: UIBarButtonItem?
    var settingsBtn: UIBarButtonItem?
    var selection: FPMineInfoSelection = .profileSelection
    var mineInfoView: FPMineInfoView?
    var activitiesView: FPPersonalActivitiesView?
    var mineInfoY: CGFloat?
    var activitiesY: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addObservers()
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(activitiesTab(notif:)), name: NSNotification.Name("ActivitiesTabClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(statisticsTab(notif:)), name: NSNotification.Name("StatisticsTabClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(settingsTab(notif:)), name: NSNotification.Name("SettingsTabClicked"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(activitiesTabBarButtonClicked(notif:)), name: NSNotification.Name("ActivitiesTabButtonTabClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(profileTabBarButtonClicked(notif:)), name: NSNotification.Name("ProfileTabButtonClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(connectionsBtnHandler(notif:)), name: NSNotification.Name("FollowerBtnClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(connectionsBtnHandler(notif:)), name: NSNotification.Name("FollowingBtnClicked"), object: nil)
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "You"
        
        friendBtn = UIBarButtonItem(image: UIImage(systemName: "person.2"), style: .plain, target: self, action: #selector(friendBtnClicked))
        settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsBtnClicked))
        self.navigationItem.leftBarButtonItem = friendBtn
        self.navigationItem.rightBarButtonItem = settingsBtn
        
        let topBar = FPMineCenterTopBar(selection: selection)
        self.view.addSubview(topBar)
        topBar.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(60)
        }
        
        mineInfoY = 63 + GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!
        mineInfoView = FPMineInfoView()
        self.view.addSubview(mineInfoView!)
        
        activitiesY = (self.navigationController?.navigationBar.frame.height)! + GetStatusBarHeight() + 70
        activitiesView = FPPersonalActivitiesView()
        self.view.addSubview(activitiesView!)
        
        switch selection {
        case .activitiesSelection:
            mineInfoView?.frame = CGRect(x: self.view.frame.width, y: mineInfoY!, width: self.view.frame.width, height: self.view.frame.height - mineInfoY!)
            activitiesView?.frame = CGRect(x: 0, y: activitiesY!, width: self.view.frame.width, height: self.view.frame.height - activitiesY!)
            break
        case .profileSelection:
            mineInfoView?.frame = CGRect(x: 0, y: mineInfoY!, width: self.view.frame.width, height: self.view.frame.height - mineInfoY!)
            activitiesView?.frame = CGRect(x: -self.view.frame.width, y: activitiesY!, width: self.view.frame.width, height: self.view.frame.height - activitiesY!)
            break
        }
        
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
    
    @objc func activitiesTabBarButtonClicked(notif: Notification) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("ExerciseDetail"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(exerciseDetailHandler(notif:)), name: Notification.Name("ExerciseDetail"), object: nil)
        self.selection = .activitiesSelection
        UIView.animate(withDuration: 0.2) {
            self.mineInfoView?.frame = CGRect(x: self.view.frame.width, y: self.mineInfoY!, width: self.view.frame.width, height: self.view.frame.height - self.mineInfoY!)
            self.activitiesView?.frame = CGRect(x: 0, y: self.activitiesY!, width: self.view.frame.width, height: self.view.frame.height - self.activitiesY!)
        }
    }
    
    @objc func profileTabBarButtonClicked(notif: Notification) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("ExerciseDetail"), object: nil)
        self.selection = .profileSelection
        UIView.animate(withDuration: 0.2) {
            self.mineInfoView?.frame = CGRect(x: 0, y: self.mineInfoY!, width: self.view.frame.width, height: self.view.frame.height - self.mineInfoY!)
            self.activitiesView?.frame = CGRect(x: -self.view.frame.width, y: self.activitiesY!, width: self.view.frame.width, height: self.view.frame.height - self.activitiesY!)
        }
    }
    
    @objc func exerciseDetailHandler(notif: Notification) {
        self.navigationController?.pushViewController(FPExerciseDetailViewController(), animated: true)
    }
    
    @objc func connectionsBtnHandler(notif: Notification) {
        if notif.name.rawValue == "FollowerBtnClicked" {
            self.navigationController?.pushViewController(FPConnectionsViewController(), animated: true)
        } else if notif.name.rawValue == "FollowingBtnClicked" {
            self.navigationController?.pushViewController(FPConnectionsViewController(), animated: true)
        }
    }
    
}

