//
//  FPExerciseDetailViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-03.
//

import UIKit

class FPExerciseDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Run"
    }

}
