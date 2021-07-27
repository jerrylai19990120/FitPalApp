//
//  FPFeedBottomBar.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-27.
//

import UIKit

class FPFeedBottomBar: UIStackView {
    
    var likeBtn: FPButton?
    var commentBtn: FPButton?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillProportionally
        self.backgroundColor = LabelBgColor
        likeBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithOnlyIcon, text: nil, icon: UIImage(systemName: "hand.thumbsup"))
        commentBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithOnlyIcon, text: nil, icon: UIImage(systemName: "text.bubble"))
        
        let separator = FPVerticalLine()
        
        self.addArrangedSubview(likeBtn!)
        self.addArrangedSubview(separator)
        self.addArrangedSubview(commentBtn!)
        separator.mas_makeConstraints { (make) in
            make?.width.equalTo()(1)
            make?.height.equalTo()(26)
        }
    }
}
