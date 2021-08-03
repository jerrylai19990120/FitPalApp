//
//  FPEditProfileViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import UIKit

class FPEditProfileViewController: UIViewController {
    
    var cancelBtn: UIBarButtonItem?
    var saveBtn: UIBarButtonItem?

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
        
        saveBtn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveBtnPressed))
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    @objc func cancelBtnPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveBtnPressed() {
        
    }

}
