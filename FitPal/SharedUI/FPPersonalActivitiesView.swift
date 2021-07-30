//
//  FPPersonalActivitiesView.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import UIKit

class FPPersonalActivitiesView: UIView {
    
    var collectionView: UICollectionView?
    var searchField: FPTextField?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        searchField = FPTextField()
        searchField?.clearButtonMode = .whileEditing
        searchField?.adjustsFontSizeToFitWidth = true
        searchField?.placeholder = "Search by title"
        searchField?.backgroundColor = DefaultLightGray
        searchField?.borderStyle = .none
        searchField?.layer.cornerRadius = 12
        searchField?.clipsToBounds = true
        let icon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = DefaultTabColor
        searchField?.leftView = icon
        searchField?.leftViewMode = .always
        
        self.addSubview(searchField!)
        searchField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self)?.offset()(16)
            make?.right.equalTo()(self)?.offset()(-16)
            make?.top.equalTo()(self)
            make?.height.equalTo()(40)
        })
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(FPActivityCell.self, forCellWithReuseIdentifier: FPActivityCell.identifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = DefaultLightGray
        self.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(searchField?.mas_bottom)?.offset()(10)
            make?.left.equalTo()(self)
            make?.right.equalTo()(self)
            make?.bottom.equalTo()(self)
        })
    }
    
}
