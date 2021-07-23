//
//  BackgroundCell.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-23.
//

import UIKit
import Masonry

class BackgroundCell: UICollectionViewCell {
    
    let bg: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = true
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentView.addSubview(bg)
        bg.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.contentView)
            make?.bottom.equalTo()(self.contentView)
            make?.left.equalTo()(self.contentView)
            make?.right.equalTo()(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init with nscoder is not implemented")
    }
    
    func configureCell(image: UIImage) {
        bg.image = image
    }
    
}
