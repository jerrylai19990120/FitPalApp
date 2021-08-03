//
//  FPSettingsCell+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import Foundation
import UIKit

extension FPSettingsCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? FPOptionCell {
            cell.selectionStyle = .none
            cell.configureCell(icon: self.icons[indexPath.row]!, label: self.labels[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: Notification.Name("ChangePasswordClicked"), object: nil)
            break
        case 1:
            NotificationCenter.default.post(name: Notification.Name("ChangeEmailClicked"), object: nil)
            break
        default:
            fatalError("Error has occurred")
        }
    }
    
}
