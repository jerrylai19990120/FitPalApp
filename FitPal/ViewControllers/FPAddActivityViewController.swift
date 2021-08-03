//
//  FPAddActivityViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import UIKit

class FPAddActivityViewController: UIViewController {
    
    var cancelBtn: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Add Activity"
        
        cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnPressed))
        self.navigationItem.leftBarButtonItem = cancelBtn
    }
    
    @objc func cancelBtnPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
