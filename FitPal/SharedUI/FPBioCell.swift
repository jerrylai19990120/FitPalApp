//
//  FPBioCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-07.
//

import UIKit

class FPBioCell: UICollectionViewCell {
    
    static let identifier = "BioCell"
    var tableView: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
