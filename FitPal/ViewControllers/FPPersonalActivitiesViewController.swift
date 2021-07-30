//
//  FPPersonalActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPPersonalActivitiesViewController: UIViewController {
    
    var activitiesView: FPPersonalActivitiesView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Activities"
        
        let searchBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItem = searchBtn
        
        activitiesView = FPPersonalActivitiesView()
        self.view.addSubview(activitiesView!)
        activitiesView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)! + 10)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
        
    }
}
