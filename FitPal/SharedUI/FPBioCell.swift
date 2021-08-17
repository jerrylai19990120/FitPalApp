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
    var bioField: FPTextField?
    var cityField: FPTextField?
    var stateField: FPTextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = DefaultWhite
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .center
        
        bioField = FPTextField()
        bioField?.placeholder = "Bio"
        cityField = FPTextField()
        cityField?.placeholder = "City"
        stateField = FPTextField()
        stateField?.placeholder = "State"
        
        vStack.addArrangedSubview(bioField!)
        vStack.addArrangedSubview(cityField!)
        vStack.addArrangedSubview(stateField!)
        bioField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(vStack)
            make?.right.equalTo()(vStack)
        })
        cityField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(vStack)
            make?.right.equalTo()(vStack)
        })
        stateField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(vStack)
            make?.right.equalTo()(vStack)
        })
        
        self.addSubview(vStack)
        vStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.contentView)?.offset()(10)
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)?.offset()(-10)
        }
    }
    
}
