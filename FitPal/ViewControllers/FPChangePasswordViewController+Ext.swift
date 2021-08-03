//
//  FPChangePasswordViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import Foundation
import UIKit

extension FPChangePasswordViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FPPasswordCell.identifier, for: indexPath) as? FPPasswordCell {
            switch indexPath.row {
            case 0:
                cell.configure(title: "Current", placeholder: "enter password")
                break
            case 1:
                cell.configure(title: "New", placeholder: "enter new password")
                break
            case 2:
                cell.configure(title: "Confirm", placeholder: "re-enter new password")
                break
            default:
                fatalError("Error has occurred")
            }
            cell.selectionStyle = .none
            cell.contentView.isUserInteractionEnabled = false
            return cell
        }
        return UITableViewCell()
    }
    
    
}
