//
//  FPConnectionsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import UIKit

class FPConnectionsViewController: UIViewController {
    
    var selection: FPSelection?
    var followingView: FPConnectionsView?
    var followersView: FPConnectionsView?
    var yOffset: CGFloat?
    var topBar: FPTopBar?
    
    init(selection: FPSelection) {
        super.init(nibName: nil, bundle: nil)
        self.selection = selection
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews(selection: self.selection!)
    }
    
    func setupViews(selection: FPSelection) {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Connections"
        
        topBar = FPTopBar(selection: selection, tabOneTitle: "Following", tabTwoTitle: "Followers")
        self.view.addSubview(topBar!)
        topBar?.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(60)
        }
        
        topBar?.firstTab?.addTarget(self, action: #selector(firstBtnClicked), for: .touchUpInside)
        topBar?.secondTab?.addTarget(self, action: #selector(secondBtnClicked), for: .touchUpInside)
        
        yOffset = 63 + GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!
        switch selection {
        case .firstSelection:
            followingView = FPConnectionsView(selection: .firstSelection)
            followingView?.frame = CGRect(x: 0, y: yOffset!, width: self.view.frame.width, height: self.view.frame.height - yOffset!)
            followersView = FPConnectionsView(selection: .secondSelection)
            followersView?.frame = CGRect(x: self.view.frame.width, y: yOffset!, width: self.view.frame.width, height: self.view.frame.height - yOffset!)
            break
        case .secondSelection:
            followingView = FPConnectionsView(selection: .firstSelection)
            followingView?.frame = CGRect(x: -self.view.frame.width, y: yOffset!, width: self.view.frame.width, height: self.view.frame.height - yOffset!)
            followersView = FPConnectionsView(selection: .secondSelection)
            followersView?.frame = CGRect(x: 0, y: yOffset!, width: self.view.frame.width, height: self.view.frame.height - yOffset!)
            break
        }
        
        self.view.addSubview(followingView!)
        self.view.addSubview(followersView!)
        
    }
    
    @objc func firstBtnClicked() {
        self.selection = .firstSelection
        UIView.animate(withDuration: 0.2) {
            self.topBar?.slidingBar?.frame = CGRect(x: 0, y: (self.topBar?.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
            self.followingView?.frame = CGRect(x: 0, y: self.yOffset!, width: self.view.frame.width, height: self.view.frame.height - self.yOffset!)
            self.followersView?.frame = CGRect(x: self.view.frame.width, y: self.yOffset!, width: self.view.frame.width, height: self.view.frame.height - self.yOffset!)
        }
    }
    
    @objc func secondBtnClicked() {
        self.selection = .secondSelection
        UIView.animate(withDuration: 0.2) {
            self.topBar?.slidingBar?.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: (self.topBar?.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
            self.followingView?.frame = CGRect(x: -self.view.frame.width, y: self.yOffset!, width: self.view.frame.width, height: self.view.frame.height - self.yOffset!)
            self.followersView?.frame = CGRect(x: 0, y: self.yOffset!, width: self.view.frame.width, height: self.view.frame.height - self.yOffset!)
        }
    }

}
