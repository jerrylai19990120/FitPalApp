//
//  FPMineCenterTopBar.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Masonry

class FPMineCenterTopBar: UIView {
    
    var activityBtn: FPButton?
    var profileBtn: FPButton?
    var hStack: UIStackView?
    var slidingBar: UIView?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        hStack = UIStackView()
        hStack?.axis = .horizontal
        hStack?.alignment = .center
        hStack?.distribution = .fillEqually
        
        activityBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlack, text: "Activities", icon: nil)
        profileBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlack, text: "Profile", icon: nil)
        hStack?.addArrangedSubview(activityBtn!)
        hStack?.addArrangedSubview(profileBtn!)
        activityBtn?.addTarget(self, action: #selector(activityBtnClicked), for: .touchUpInside)
        profileBtn?.addTarget(self, action: #selector(profileBtnClicked), for: .touchUpInside)
        
        self.addSubview(hStack!)
        hStack?.mas_makeConstraints { (make) in
            make?.top.equalTo()(self)
            make?.left.equalTo()(self)
            make?.right.equalTo()(self)
            make?.bottom.equalTo()(self)
        }
        
        slidingBar = UIView()
        slidingBar?.backgroundColor = DefaultBlue
        self.addSubview(slidingBar!)
        slidingBar?.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width / 2, height: 3)
    }
    
    @objc func activityBtnClicked() {
        UIView.animate(withDuration: 0.2) {
            self.slidingBar?.frame = CGRect(x: 0, y: (self.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
        }
        
    }
    
    @objc func profileBtnClicked() {
        UIView.animate(withDuration: 0.2) {
            self.slidingBar?.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: (self.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
        }
        
    }
    
}
