//
//  FPAddFriendsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit
import Lottie

class FPAddFriendsViewController: UIViewController {
    
    var searchField: FPTextField?
    var collectionView: UICollectionView?
    var results = [String]()
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationView?.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animationView?.stop()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Find Friends"
        
        searchField = FPTextField()
        searchField?.clearButtonMode = .whileEditing
        searchField?.adjustsFontSizeToFitWidth = true
        searchField?.placeholder = "Search on FitPal"
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
        
        animationView = AnimationView(animation: Animation.named("running"))
        animationView?.isUserInteractionEnabled = false
        animationView?.loopMode = .loop
        self.view.addSubview(animationView!)
        animationView?.mas_makeConstraints { (make) in
            make?.centerX.equalTo()(self.view.mas_centerX)
            make?.centerY.equalTo()(self.view.mas_centerY)
            make?.width.equalTo()(self.view.frame.width * 0.5)
            make?.height.equalTo()(self.view.frame.width * 0.5)
        }
        
        let label = UILabel()
        label.text = "Find your friends on FitPal"
        label.textColor = DefaultTabColor
        label.font = FontMain
        self.view.addSubview(label)
        label.mas_makeConstraints { (make) in
            make?.top.equalTo()(animationView?.mas_bottom)?.offset()(16)
            make?.centerX.equalTo()(self.view.mas_centerX)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultWhite
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(searchField?.mas_bottom)?.offset()(10)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
        
        if results.count == 0 {
            collectionView?.isHidden = true
            animationView?.isHidden = false
            label.isHidden = false
        } else {
            collectionView?.isHidden = false
            animationView?.isHidden = true
            label.isHidden = true
        }
        
    }

}
