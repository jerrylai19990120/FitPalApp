//
//  FPAllTimeStatCell+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import Foundation
import UIKit

extension FPAllTimeStatCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FPStatTableViewCell.identifier, for: indexPath) as? FPStatTableViewCell {
            cell.configure(title: self.labels[indexPath.row], data: self.statData[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}
