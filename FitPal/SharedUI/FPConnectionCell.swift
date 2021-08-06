//
//  FPConnectionCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-05.
//

import UIKit

class FPConnectionCell: UITableViewCell {
    
    static let identifier = "ConnectionCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews() {
        
    }
    
}
