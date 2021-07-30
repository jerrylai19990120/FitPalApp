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
    
    static let identifier = "ActivityCell"
    
    var avatarView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = true
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 36 / 2
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "anon")
        return imgView
    }()
    
    var nameLabel: UILabel?
    var timeLabel: UILabel?
    var titleLabel: UILabel?
    var desLabel: UILabel?
    var statusView: FPFeedStatusView?
    var map: MKMapView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.backgroundColor = DefaultWhite
        self.contentView.layer.shadowRadius = 3
        self.contentView.layer.shadowColor = DefaultBlack?.cgColor
        
        let vStackLayout = UIStackView()
        vStackLayout.axis = .vertical
        vStackLayout.alignment = .center
        vStackLayout.distribution = .fillProportionally
        vStackLayout.spacing = 0
        
        self.contentView.addSubview(vStackLayout)
        vStackLayout.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.contentView)?.offset()(16)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.right.equalTo()(self.contentView)?.offset()(-16)
            make?.bottom.equalTo()(self.contentView)?.offset()(-60)
        }
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        hStack.spacing = 8
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .leading
        vStack.spacing = 1
        
        nameLabel = UILabel()
        nameLabel?.text = "Jerry Lai"
        nameLabel?.font = FontSmallTitle
        nameLabel?.textColor = DefaultBlack
        
        timeLabel = UILabel()
        timeLabel?.text = "Today at 5:50 PM Toronto Ontario"
        timeLabel?.font = FontExtraTiny
        timeLabel?.textColor = DefaultTabColor
        
        vStack.addArrangedSubview(nameLabel!)
        vStack.addArrangedSubview(timeLabel!)
        
        let moreBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithOnlyIcon, text: nil, icon: UIImage(systemName: "ellipsis"))
        
        hStack.addArrangedSubview(avatarView)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(moreBtn)
        
        vStackLayout.addArrangedSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            //make?.top.equalTo()(self.contentView)?.offset()(16)
            make?.left.equalTo()(self.contentView)?.offset()(16)
            make?.right.equalTo()(self.contentView)?.offset()(-16)
            make?.height.equalTo()(50)
        }
        
        avatarView.mas_makeConstraints { (make) in
            make?.width.equalTo()(36)
            make?.height.equalTo()(36)
        }
        moreBtn.mas_makeConstraints { (make) in
            make?.width.equalTo()(40)
            make?.height.equalTo()(40)
        }
        
        titleLabel = UILabel()
        titleLabel?.text = "Tempo Run Tuesday"
        titleLabel?.textColor = DefaultBlack
        titleLabel?.font = FontMediumTitle
        titleLabel?.textAlignment = .left
        vStackLayout.addArrangedSubview(titleLabel!)
        titleLabel?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width)
            make?.height.equalTo()(30)
        })
        
        desLabel = UILabel()
        desLabel?.text = "5min for 5K and 4min for 5K, feelin' fresh"
        desLabel?.textColor = DefaultTabColor
        desLabel?.font = FontExtraTiny
        desLabel?.textAlignment = .left
        vStackLayout.addArrangedSubview(desLabel!)
        desLabel?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width)
            make?.height.equalTo()(20)
        })
        
        statusView = FPFeedStatusView()
        vStackLayout.addArrangedSubview(statusView!)
        statusView?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width)
            make?.height.equalTo()(60)
        })
        
        map = MKMapView()
        map?.showsUserLocation = false
        map?.mapType = .standard
        map?.isScrollEnabled = false
        map?.isZoomEnabled = false
        map?.delegate = self
        vStackLayout.addArrangedSubview(map!)
        map?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width)
            make?.height.equalTo()(UIScreen.main.bounds.height * 0.26)
        })
        
        let bottomBar = FPFeedBottomBar()
        self.addSubview(bottomBar)
        bottomBar.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
            make?.top.equalTo()(vStackLayout.mas_bottom)
            make?.height.equalTo()(60)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        
    }
    
}

extension FPActivityCell: MKMapViewDelegate {
    
}
