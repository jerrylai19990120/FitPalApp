//
//  FPHeaderCollectionView.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-29.
//

import UIKit

class FPHeaderCollectionView: UICollectionReusableView {
        
    static let identifier = "HeaderView"
    
    var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        label = UILabel()
        label?.text = "Header"
        label?.textColor = DefaultTabColor
        label?.font = FontExtraTiny
        label?.textAlignment = .left
        self.addSubview(label!)
        label?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self)?.offset()(10)
            make?.left.equalTo()(self)?.offset()(10)
            make?.bottom.equalTo()(self)?.offset()(-10)
        })
    }
    
    func configureTitle(title: String) {
        label?.text = title
    }
    
}
