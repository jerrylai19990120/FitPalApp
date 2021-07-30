//
//  FPAvgStatTableViewCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import UIKit

class FPStatTableViewCell: UITableViewCell {
    
    static let identifier = "AvgStatTableViewCell"
    var titleLabel: UILabel?
    var dataLabel: UILabel?

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
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fillEqually
        
        titleLabel = UILabel()
        titleLabel?.text = "Loading"
        titleLabel?.textColor = DefaultBlack
        titleLabel?.font = FontSmallThin
        titleLabel?.textAlignment = .left
        
        dataLabel = UILabel()
        dataLabel?.text = "Loading"
        dataLabel?.textColor = DefaultTabColor
        dataLabel?.font = FontSmallThin
        dataLabel?.textAlignment = .right
        
        hStack.addArrangedSubview(titleLabel!)
        hStack.addArrangedSubview(dataLabel!)
        
        self.addSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            make?.height.equalTo()(45)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.9)
            make?.left.equalTo()(self.contentView)?.offset()(UIScreen.main.bounds.width * 0.05)
        }

    }
    
    func configure(title: String, data: String) {
        titleLabel?.text = title
        dataLabel?.text = data
    }

}
