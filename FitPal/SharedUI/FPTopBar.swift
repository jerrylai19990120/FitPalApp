//
//  FPMineCenterTopBar.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Masonry

class FPTopBar: UIView {
    
    var firstTab: FPButton?
    var secondTab: FPButton?
    var hStack: UIStackView?
    var slidingBar: UIView?
    var selection: FPMineInfoSelection?
    var tabOneTitle: String?
    var tabTwoTitle: String?
    
    init(selection: FPMineInfoSelection, tabOneTitle: String, tabTwoTitle: String) {
        super.init(frame: .zero)
        self.selection = selection
        self.setupViews(tabOneTitle: tabOneTitle, tabTwoTitle: tabTwoTitle)
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(tabOneTitle: String, tabTwoTitle: String) {
        hStack = UIStackView()
        hStack?.axis = .horizontal
        hStack?.alignment = .center
        hStack?.distribution = .fillEqually
        
        firstTab = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlack, text: tabOneTitle, icon: nil)
        secondTab = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlack, text: tabTwoTitle, icon: nil)
        hStack?.addArrangedSubview(firstTab!)
        hStack?.addArrangedSubview(secondTab!)
        firstTab?.addTarget(self, action: #selector(activityBtnClicked), for: .touchUpInside)
        secondTab?.addTarget(self, action: #selector(profileBtnClicked), for: .touchUpInside)
        
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
        switch selection {
        case .firstSelection:
            slidingBar?.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width / 2, height: 3)
            break
        case .secondSelection:
            slidingBar?.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: 60, width: UIScreen.main.bounds.width / 2, height: 3)
            break
        default:
            fatalError("Error has occurred")
        }
    }
    
    @objc func activityBtnClicked() {
        UIView.animate(withDuration: 0.2) {
            self.slidingBar?.frame = CGRect(x: 0, y: (self.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
        }
        NotificationCenter.default.post(name: Notification.Name("ActivitiesTabButtonTabClicked"), object: nil)
    }
    
    @objc func profileBtnClicked() {
        UIView.animate(withDuration: 0.2) {
            self.slidingBar?.frame = CGRect(x: UIScreen.main.bounds.width / 2, y: (self.hStack?.frame.height)!, width: UIScreen.main.bounds.width / 2, height: 3)
        }
        NotificationCenter.default.post(name: Notification.Name("ProfileTabButtonClicked"), object: nil)
    }
    
}
