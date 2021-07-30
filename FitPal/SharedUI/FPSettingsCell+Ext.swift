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
            cell.configureCell(icon: self.icons[indexPath.row]!, label: self.labels[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
