//
//  FPActivityCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit
import Masonry
import MapKit

class FPActivityCell: UICollectionViewCell {
    
    var avatarView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = true
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = 50 / 2
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "anon")
        return imgView
    }()
    
    var nameLabel: UILabel?
    var timeLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.backgroundColor = DefaultWhite
        self.contentView.layer.shadowRadius = 3
        self.contentView.layer.shadowColor = DefaultBlack?.cgColor
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.alignment = .center
        
        nameLabel = UILabel()
        nameLabel?.text = "Jerry Lai"
        nameLabel?.font = FontSmallTitle
        nameLabel?.textColor = DefaultBlack
        
        let moreBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithOnlyIcon, text: nil, icon: UIImage(systemName: "ellipsis"))
        
        hStack.addArrangedSubview(avatarView)
        hStack.addArrangedSubview(nameLabel!)
        hStack.addSubview(moreBtn)
        
        self.contentView.addSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            make?.width.equalTo()(400)
            make?.top.equalTo()(self.contentView)
            make?.height.equalTo()(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        
    }
    
}
