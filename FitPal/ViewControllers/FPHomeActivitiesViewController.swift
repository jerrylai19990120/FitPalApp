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
    var addButton: UIButton?
    var settingsBtn: UIBarButtonItem?
    var didRotate: Bool?
    var manualActivitySection: UIView?
    var cover: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addObservers()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        
        didRotate = false
        addButton = UIButton(type: .system)
        addButton?.tintColor = DefaultBlue
        addButton?.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addButton?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        addButton?.addTarget(self, action: #selector(addBtnClicked), for: .touchUpInside)
        addBtn = UIBarButtonItem(customView: addButton!)
        
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
        
        cover = UIView()
        cover?.backgroundColor = DefaultBlack
        cover?.alpha = 0.6
        cover?.isHidden = true
        self.view.addSubview(cover!)
        cover?.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)?.offset()((self.tabBarController?.tabBar.frame.height)!)
            make?.top.equalTo()(self.view)
        }
        
        let touch = UITapGestureRecognizer(target: self, action: #selector(touchHandler))
        touch.numberOfTouchesRequired = 1
        cover?.addGestureRecognizer(touch)
        
        manualActivitySection = UIView()
        manualActivitySection?.backgroundColor = DefaultWhite
        manualActivitySection?.frame = CGRect(x: 0, y: GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! - 90, width: self.view.frame.width, height: 90)
        self.view.addSubview(manualActivitySection!)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .center
        
        let icon = UIImageView(image: UIImage(systemName: "waveform.path.ecg.rectangle")?.withRenderingMode(.alwaysTemplate))
        icon.tintColor = DefaultBlue
        icon.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel()
        titleLabel.text = "Manual Activity"
        titleLabel.textColor = DefaultTabColor
        titleLabel.font = FontExtraTiny
        
        vStack.addArrangedSubview(icon)
        vStack.addArrangedSubview(titleLabel)
        manualActivitySection?.addSubview(vStack)
        vStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(manualActivitySection)
            make?.left.equalTo()(manualActivitySection)
            make?.right.equalTo()(manualActivitySection)
            make?.bottom.equalTo()(manualActivitySection)
        }
        icon.mas_makeConstraints { (make) in
            make?.top.equalTo()(vStack)?.offset()(20)
            make?.left.equalTo()(vStack)
            make?.right.equalTo()(vStack)
            make?.height.equalTo()(40)
        }
        titleLabel.mas_makeConstraints { (make) in
            make?.top.equalTo()(icon.mas_bottom)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addActivityBtnClicked))
        tap.numberOfTapsRequired = 1
        vStack.addGestureRecognizer(tap)
    
    }
    
    @objc func addActivityBtnClicked() {
        let addActivityVC = FPAddActivityViewController()
        addActivityVC.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(addActivityVC, animated: true)
    }
    
    @objc func friendBtnClicked() {
        self.navigationController?.pushViewController(FPAddFriendsViewController(), animated: true)
    }
    
    @objc func settingsBtnClicked() {
        self.navigationController?.pushViewController(FPSettingsViewController(), animated: true)
    }
    
    @objc func touchHandler() {
        self.didRotate = false
        self.cover?.isHidden = true
        self.addBtn?.customView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi * 1/4))
        UIView.animate(withDuration: 0.2) {
            self.addBtn?.customView?.transform = .identity
            self.manualActivitySection?.frame = CGRect(x: 0, y: GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! - 90, width: self.view.frame.width, height: 90)
        } completion: { (finished) in
            self.addButton?.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        }
    }
    
    @objc func addBtnClicked() {
        if !self.didRotate! {
            self.didRotate = true
            self.cover?.isHidden = false
            self.addBtn?.customView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi * -1/4))
            UIView.animate(withDuration: 0.2) {
                self.addBtn?.customView?.transform = .identity
                self.manualActivitySection?.frame = CGRect(x: 0, y: GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!, width: self.view.frame.width, height: 90)
            } completion: { (finished) in
                self.addButton?.setImage(UIImage(systemName: "xmark"), for: .normal)
            }
        } else {
            self.didRotate = false
            self.cover?.isHidden = true
            self.addBtn?.customView?.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi * 1/4))
            UIView.animate(withDuration: 0.2) {
                self.addBtn?.customView?.transform = .identity
                self.manualActivitySection?.frame = CGRect(x: 0, y: GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! - 90, width: self.view.frame.width, height: 90)
            } completion: { (finished) in
                self.addButton?.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            }
        }

    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(exerciseDetailHandler(notif:)), name: Notification.Name("ExerciseDetail"), object: nil)
    }
    
    @objc func exerciseDetailHandler(notif: Notification) {
        self.navigationController?.pushViewController(FPExerciseDetailViewController(), animated: true)
    }

}
