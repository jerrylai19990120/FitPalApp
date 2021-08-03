//
//  FPProfileCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit

class FPProfileCell: UICollectionViewCell {
    
    var avatar: UIImageView?
    var nameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = DefaultWhite
        avatar = UIImageView()
        avatar?.image = UIImage(named: "anon")
        avatar?.contentMode = .scaleAspectFill
        avatar?.layer.cornerRadius = 50 / 2
        avatar?.clipsToBounds = true
        self.addSubview(avatar!)
        avatar?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)?.offset()(10)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.height.equalTo()(50)
            make?.width.equalTo()(50)
        })
        
        nameLabel = UILabel()
        nameLabel?.text = "Jerry Lai"
        nameLabel?.textColor = DefaultBlack
        nameLabel?.font = FontMainTitle
        self.addSubview(nameLabel!)
        nameLabel?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.contentView)?.offset()(16)
            make?.left.equalTo()(avatar?.mas_right)?.offset()(16)
        })
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        hStack.spacing = 16
        self.addSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(avatar?.mas_bottom)?.offset()(10)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.right.equalTo()(self.contentView)?.offset()(-16)
            make?.bottom.equalTo()(self.contentView)
        }
        
        let followingStack = UIStackView()
        followingStack.axis = .vertical
        followingStack.distribution = .fillEqually
        followingStack.alignment = .leading
        followingStack.spacing = 6
        
        let followingLabel = UILabel()
        followingLabel.text = "Following"
        followingLabel.textColor = DefaultBlue
        followingLabel.font = FontExtraTiny
        
        let followingNum = UILabel()
        followingNum.text = "40"
        followingNum.textColor = DefaultBlack
        followingNum.font = FontDetail
        
        followingStack.addArrangedSubview(followingLabel)
        followingStack.addArrangedSubview(followingNum)
        
        let followerStack = UIStackView()
        followerStack.axis = .vertical
        followerStack.distribution = .fillEqually
        followerStack.alignment = .leading
        followerStack.spacing = 6
        
        let followerLabel = UILabel()
        followerLabel.text = "Followers"
        followerLabel.textColor = DefaultBlue
        followerLabel.font = FontExtraTiny
        
        let followerNum = UILabel()
        followerNum.text = "40"
        followerNum.textColor = DefaultBlack
        followerNum.font = FontDetail
        
        let separator = FPVerticalLine()
        
        followerStack.addArrangedSubview(followerLabel)
        followerStack.addArrangedSubview(followerNum)
        
        let editBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithBorderBlueTextBlue, text: "Edit Profile", icon: nil)
        
        hStack.addArrangedSubview(followingStack)
        hStack.addArrangedSubview(separator)
        hStack.addArrangedSubview(followerStack)
        hStack.addArrangedSubview(editBtn)
        followingStack.mas_makeConstraints { (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.18)
        }
        followerStack.mas_makeConstraints { (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.36)
        }
        separator.mas_makeConstraints { (make) in
            make?.height.equalTo()(26)
            make?.width.equalTo()(2)
        }
        
        let followerTouch = UITapGestureRecognizer(target: self, action: #selector(followerStackClicked))
        followerTouch.numberOfTapsRequired = 1
        
        let followingTouch = UITapGestureRecognizer(target: self, action: #selector(followingStackClicked))
        followingTouch.numberOfTapsRequired = 1
        
        followerStack.addGestureRecognizer(followerTouch)
        followingStack.addGestureRecognizer(followingTouch)
        
    }
    
    @objc func followerStackClicked() {
        NotificationCenter.default.post(name: Notification.Name("FollowerBtnClicked"), object: nil)
    }
    
    @objc func followingStackClicked() {
        NotificationCenter.default.post(name: Notification.Name("FollowingBtnClicked"), object: nil)
    }
    
}
