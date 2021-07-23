//
//  MainViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-21.
//

import UIKit
import Masonry

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        button.setTitle("TESTING", for: UIControl.State.normal)
        
        self.view.addSubview(button)
        self.view.backgroundColor = DefaultBlue
        
    }


}

