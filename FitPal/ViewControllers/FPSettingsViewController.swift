//
//  FPSettingsViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-28.
//

import UIKit

class FPSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Settings"
    }

}
