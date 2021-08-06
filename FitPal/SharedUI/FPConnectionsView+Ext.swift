//
//  FPConnectionsView+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-05.
//

import Foundation
import UIKit

extension FPConnectionsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FPConnectionCell.identifier, for: indexPath) as? FPConnectionCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = FPHeaderTableView()
        switch self.selection {
        case .firstSelection:
            headerView.configureTitle(title: "ATHLETES YOU ARE FOLLOWING")
            break
        case .secondSelection:
            headerView.configureTitle(title: "ATHLETES WHO FOLLOW YOU")
            break
        default:
            fatalError("Error has occurred")
        }
        
        return headerView
    }
    
}
