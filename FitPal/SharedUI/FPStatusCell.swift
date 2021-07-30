//
//  FPStatusCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Masonry

class FPStatusCell: UICollectionViewCell {
    
    var tableView: UITableView?
    var labels = ["Activities", "Statistics", "Settings"]
    var icons = [
        UIImage(systemName: "figure.walk"),
        UIImage(systemName: "chart.pie"),
        UIImage(systemName: "gearshape")
    ]
    
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
        tableView?.register(FPOptionCell.self, forCellReuseIdentifier: "OptionCell")
        tableView?.showsVerticalScrollIndicator = false
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = DefaultWhite
        tableView?.rowHeight = 50
        tableView?.isScrollEnabled = false
        self.addSubview(tableView!)
        tableView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)
        })
    }
    
}
