//
//  FPAddFriendsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPAddFriendsViewController: UIViewController {
    
    var searchField: FPTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Find Friends"
        
        searchField = FPTextField()
        searchField?.clearButtonMode = .whileEditing
        searchField?.adjustsFontSizeToFitWidth = true
        searchField?.placeholder = "Search on FitPal"
        searchField?.backgroundColor = DefaultLightGray
        searchField?.borderStyle = .none
        searchField?.layer.cornerRadius = 12
        searchField?.clipsToBounds = true
        let icon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = DefaultTabColor
        searchField?.leftView = icon
        searchField?.leftViewMode = .always
        
        self.view.addSubview(searchField!)
        searchField?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.view)?.offset()(16)
            make?.right.equalTo()(self.view)?.offset()(-16)
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! + 10)
            make?.height.equalTo()(40)
        })
    }

}
