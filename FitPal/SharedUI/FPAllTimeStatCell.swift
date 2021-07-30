//
//  FPAllTimeStatCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import UIKit

class FPAllTimeStatCell: UICollectionViewCell {
    
    var tableView: UITableView?
    let labels = ["Runs", "Distance"]
    let statData = ["561", "4111 km"]
    
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
        tableView?.register(FPStatTableViewCell.self, forCellReuseIdentifier: FPStatTableViewCell.identifier)
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
