//
//  FPConnectionsView.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-05.
//

import UIKit

class FPConnectionsView: UIView {

    var tableView: UITableView?
    var selection: FPSelection?
    
    init(selection: FPSelection) {
        super.init(frame: .zero)
        self.selection = selection
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        tableView = UITableView()
        tableView?.showsVerticalScrollIndicator = false
        tableView?.backgroundColor = DefaultWhite
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(FPConnectionCell.self, forCellReuseIdentifier: FPConnectionCell.identifier)
        tableView?.register(FPHeaderTableView.self, forHeaderFooterViewReuseIdentifier: FPHeaderTableView.identifier)
        self.addSubview(tableView!)
        tableView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self)
            make?.left.equalTo()(self)
            make?.right.equalTo()(self)
            make?.bottom.equalTo()(self)
        })
    }

}
