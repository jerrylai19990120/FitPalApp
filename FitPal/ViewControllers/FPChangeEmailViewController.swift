//
//  FPChangeEmailViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-02.
//

import UIKit

class FPChangeEmailViewController: UIViewController {
    
    var tableView: UITableView?
    var saveBtn: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Change Email"
        
        saveBtn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveBtnClicked))
        self.navigationItem.rightBarButtonItem = saveBtn
        saveBtn?.isEnabled = false
        
        tableView = UITableView()
        tableView?.rowHeight = 40
        tableView?.isScrollEnabled = false
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FPPasswordCell.self, forCellReuseIdentifier: FPPasswordCell.identifier)
        self.view.addSubview(tableView!)
        tableView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.view)?.offset()(40 + GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(80)
        })
    }
    
    @objc func saveBtnClicked() {
        
    }
    
}
