//
//  FPHomeActivitiesViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-26.
//

import UIKit

class FPHomeActivitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
    }

}
