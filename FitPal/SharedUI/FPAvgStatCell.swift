//
//  FPAvgStatCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import UIKit

class FPAvgStatCell: UICollectionViewCell {
    
    var tableView: UITableView?
    let labels = ["Avg Runs/Week", "Avg Time/Week", "Avg Distance/Week"]
    let statData = ["3", "2h 23m", "25 km"]
    
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
