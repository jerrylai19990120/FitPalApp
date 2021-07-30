//
//  FPLogOutCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import UIKit

class FPLogOutCell: UICollectionViewCell {
    
    static let identifier = "LogOutCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = DefaultWhite
        let logoutLabel = UILabel()
        logoutLabel.text = "Log Out"
        logoutLabel.textColor = DefaultRed
        logoutLabel.font = FontDetail
        
        self.addSubview(logoutLabel)
        logoutLabel.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.contentView.mas_centerY)
            make?.centerX.equalTo()(self.contentView.mas_centerX)
        }
    }
    
}
