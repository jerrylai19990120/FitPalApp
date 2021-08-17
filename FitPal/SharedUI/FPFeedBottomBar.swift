//
//  FPFeedBottomBar.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit
import Lottie

class FPFeedBottomBar: UIStackView {
    
    var likeBtn: AnimationView?
    var commentBtn: FPButton?
    var didLike: Bool?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.didLike = false
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillProportionally
        self.backgroundColor = LabelBgColor
        
        likeBtn = AnimationView(animation: Animation.named("like"))
        likeBtn?.loopMode = .playOnce
        likeBtn?.currentFrame = 0
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeBtnClicked))
        tap.numberOfTapsRequired = 1
        likeBtn?.addGestureRecognizer(tap)
        
        commentBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithOnlyIcon, text: nil, icon: UIImage(systemName: "text.bubble"))
        commentBtn?.addTarget(self, action: #selector(commentBtnClicked), for: .touchUpInside)
        
        let separator = FPVerticalLine()
        
        self.addArrangedSubview(likeBtn!)
        self.addArrangedSubview(separator)
        self.addArrangedSubview(commentBtn!)
        likeBtn?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width / 2 - 0.5)
            make?.height.equalTo()(40)
        })
        commentBtn?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width / 2 - 0.5)
            make?.height.equalTo()(40)
        })
        separator.mas_makeConstraints { (make) in
            make?.width.equalTo()(1)
            make?.height.equalTo()(26)
        }
    }
    
    @objc func likeBtnClicked() {
        if self.didLike! {
            self.didLike = false
            self.likeBtn?.currentProgress = 0
        } else {
            self.didLike = true
            self.likeBtn?.play()
        }
    }
    
    @objc func commentBtnClicked() {
        NotificationCenter.default.post(name: Notification.Name("CommentBtnClicked"), object: nil)
    }
}
