//
//  FPSettingsCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import UIKit

class FPSettingsCell: UICollectionViewCell {
    
    static let identifier = "SettingsCell"
    
    var tableView: UITableView?
    var labels = ["Change Password", "Change Email"]
    var icons = [UIImage(systemName: "key"), UIImage(systemName: "envelope")]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = DefaultWhite
        
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FPOptionCell.self, forCellReuseIdentifier: "OptionCell")
        tableView?.isScrollEnabled = false
        tableView?.showsVerticalScrollIndicator = false
        tableView?.rowHeight = 45
        self.addSubview(tableView!)
        tableView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)
        })
    }
    
}
