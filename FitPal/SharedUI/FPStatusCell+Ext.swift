//
//  FPStatusCell+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import Foundation
import UIKit

extension FPStatusCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? FPOptionCell {
            cell.configureCell(icon: self.icons[indexPath.row]!, label: self.labels[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            NotificationCenter.default.post(name: Notification.Name("ActivitiesTabClicked"), object: nil)
        } else if indexPath.row == 1 {
            NotificationCenter.default.post(name: Notification.Name("StatisticsTabClicked"), object: nil)
        } else if indexPath.row == 2 {
            NotificationCenter.default.post(name: Notification.Name("SettingsTabClicked"), object: nil)
        }
    }
    
}
