//
//  FPPasswordCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import UIKit

class FPPasswordCell: UITableViewCell {
    
    static let identifier = "PasswordCell"
    var titleLabel: UILabel?
    var passwordField: FPTextField?

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
        titleLabel = UILabel()
        titleLabel?.text = "Current"
        titleLabel?.textColor = DefaultBlack
        titleLabel?.font = FontSmallThin
        self.addSubview(titleLabel!)
        
        passwordField = FPTextField()
        passwordField?.placeholder = "enter password"
        passwordField?.borderStyle = .none
        passwordField?.isSecureTextEntry = true
        self.addSubview(passwordField!)
        
        titleLabel?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.height.equalTo()(40)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.2)
            make?.left.equalTo()(self.contentView)?.offset()(16)
        })
        
        passwordField?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)
            make?.height.equalTo()(40)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.7)
            make?.left.equalTo()(titleLabel?.mas_right)?.offset()(16)
        })
    }
    
    func configure(title: String, placeholder: String) {
        self.titleLabel?.text = title
        self.passwordField?.placeholder = placeholder
    }

}
