//
//  LoginViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-24.
//

import UIKit
import Masonry

class LoginViewController: UIViewController {
    
    var hStack: UIStackView?
    var vStackButtons: UIStackView?
    var vStackInputs: UIStackView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .fillEqually
        hStack.spacing = self.view.frame.width * 0.1
        
        let backBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderLeftIconBlue, text: "back", icon: UIImage(systemName: "chevron.left"))
        let titleLabel = UILabel()
        titleLabel.text = "Log In"
        titleLabel.textColor = DefaultBlack
        titleLabel.font = FontMainTitle
        titleLabel.textAlignment = .center
        
        let loginBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlue, text: "Log In", icon: nil)
        hStack.addArrangedSubview(backBtn)
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(loginBtn)
        
        self.view.addSubview(hStack)
        
        hStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height * 0.15)
        }
        
        self.setupButtons()
        
        self.setupInputTextfields()
        
    }
    
    func setupButtons() {
        
    }
    
    func setupInputTextfields() {
        
    }

}

