//
//  FPHomeViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import UIKit

class FPHomeViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [FPHomeActivitiesViewController()]
    }

}
