//
//  FPOptionCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit

class FPOptionCell: UITableViewCell {
    
    var iconView: UIImageView?
    var label: UILabel?
    var arrowView: UIImageView?

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
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        
        iconView = UIImageView()
        iconView?.contentMode = .scaleAspectFit
        iconView?.image = UIImage(systemName: "gearshape")?.withRenderingMode(.alwaysTemplate)
        iconView?.tintColor = DefaultBlack
        
        
        label = UILabel()
        label?.text = "Activities"
        label?.textColor = DefaultBlack
        label?.font = FontTiny
        
        arrowView = UIImageView()
        arrowView?.contentMode = .scaleAspectFit
        arrowView?.image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        arrowView?.tintColor = DefaultBlack
        
        hStack.addArrangedSubview(iconView!)
        hStack.addArrangedSubview(label!)
        hStack.addArrangedSubview(arrowView!)
        
        iconView?.mas_makeConstraints { (make) in
            make?.width.equalTo()(20)
            make?.height.equalTo()(20)
        }
        
        label?.mas_makeConstraints { (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.7)
            make?.height.equalTo()(40)
            make?.left.equalTo()(iconView?.mas_right)?.equalTo()(10)
        }
        
        arrowView?.mas_makeConstraints { (make) in
            make?.width.equalTo()(16)
            make?.height.equalTo()(16)
        }
        
        self.contentView.addSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.contentView)?.offset()(3)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.right.equalTo()(self.contentView)?.offset()(-16)
            make?.bottom.equalTo()(self.contentView)?.offset()(3)
        }
        
    }
    
    func configureCell(icon: UIImage, label: String) {
        iconView?.image = icon.withRenderingMode(.alwaysTemplate)
        iconView?.tintColor = DefaultBlack
        self.label?.text = label
    }

}
