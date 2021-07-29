//
//  LoginViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-24.
//

import UIKit
import Masonry
import FBSDKLoginKit
import Firebase
import GoogleSignIn
import AuthenticationServices

class FPLoginViewController: UIViewController {
    
    var hStack: UIStackView?
    var vStackButtons: UIStackView?
    var vStackInputs: UIStackView?
    var emailField: UITextField?
    var passwordField: UITextField?
    var loginBtn: FPButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultWhite
        
        hStack = UIStackView()
        hStack?.axis = .horizontal
        hStack?.alignment = .center
        hStack?.distribution = .fillEqually
        hStack?.spacing = self.view.frame.width * 0.1
        
        let backBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderLeftIconBlue, text: "back", icon: UIImage(systemName: "chevron.left"))
        backBtn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        
        let titleLabel = UILabel()
        titleLabel.text = "Log In"
        titleLabel.textColor = DefaultBlack
        titleLabel.font = FontMainTitle
        titleLabel.textAlignment = .center
        
        loginBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlue, text: "Log In", icon: nil)
        loginBtn?.setTitleColor(DefaultDarkGray, for: .normal)
        loginBtn?.isEnabled = false
        loginBtn?.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        
        hStack?.addArrangedSubview(backBtn)
        hStack?.addArrangedSubview(titleLabel)
        hStack?.addArrangedSubview(loginBtn!)
        
        self.view.addSubview(hStack!)
        
        hStack?.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height * 0.15)
        }
        
        self.setupButtons()
        
        self.setupInputTextfields()
        
        let forgotPassword = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithUnderlinedTextNoBorder, text: "Forgot Password", icon: nil)
        
        self.view.addSubview(forgotPassword)
        forgotPassword.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.vStackInputs?.mas_bottom)?.offset()(6)
            make?.left.equalTo()(18)
        }
        
    }
    
    func setupButtons() {
        vStackButtons = UIStackView()
        vStackButtons?.axis = .vertical
        vStackButtons?.alignment = .center
        vStackButtons?.distribution = .fillEqually
        vStackButtons?.spacing = 8
        
        let loginFB = FBLoginButton()
        let loginGoogle = GIDSignInButton()
        loginGoogle.style = .wide
        let loginApple = ASAuthorizationAppleIDButton()
        
        vStackButtons?.addArrangedSubview(loginFB)
        vStackButtons?.addArrangedSubview(loginGoogle)
        vStackButtons?.addArrangedSubview(loginApple)
        
        self.view.addSubview(vStackButtons!)
        vStackButtons?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.hStack?.mas_bottom)?.offset()(-30)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height / 6)
        })
        
        loginFB.mas_makeConstraints { (make) in
            make?.left.equalTo()(vStackButtons)?.offset()(18)
            make?.right.equalTo()(vStackButtons)?.offset()(-18)
        }
        loginGoogle.mas_makeConstraints { (make) in
            make?.left.equalTo()(vStackButtons)?.offset()(18)
            make?.right.equalTo()(vStackButtons)?.offset()(-18)
        }
        loginApple.mas_makeConstraints { (make) in
            make?.left.equalTo()(vStackButtons)?.offset()(18)
            make?.right.equalTo()(vStackButtons)?.offset()(-18)
        }
    }
    
    func setupInputTextfields() {
        vStackInputs = UIStackView()
        vStackInputs?.axis = .vertical
        vStackInputs?.alignment = .center
        vStackInputs?.distribution = .fillEqually
        vStackInputs?.spacing = 0
        
        emailField = UITextField()
        emailField?.placeholder = "Email"
        emailField?.borderStyle = .roundedRect
        emailField?.clearButtonMode = .whileEditing
        emailField?.delegate = self
        
        passwordField = UITextField()
        passwordField?.placeholder = "Password"
        passwordField?.borderStyle = .roundedRect
        passwordField?.clearButtonMode = .whileEditing
        passwordField?.delegate = self
        
        vStackInputs?.addArrangedSubview(emailField!)
        vStackInputs?.addArrangedSubview(passwordField!)
        
        self.view.addSubview(vStackInputs!)
        vStackInputs?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(self.vStackButtons?.mas_bottom)?.offset()(30)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height * 0.1)
        })
        emailField?.mas_makeConstraints { (make) in
            make?.left.equalTo()(vStackInputs)?.offset()(18)
            make?.right.equalTo()(vStackInputs)?.offset()(-18)
        }
        
        passwordField?.mas_makeConstraints { (make) in
            make?.left.equalTo()(vStackInputs)?.offset()(18)
            make?.right.equalTo()(vStackInputs)?.offset()(-18)
        }

    }
    
    @objc func loginBtnClicked() {
        let fitnessCenterVC = FPFitnessCenterViewController()
        fitnessCenterVC.modalPresentationStyle = .fullScreen
        self.present(fitnessCenterVC, animated: true, completion: nil)
    }
    
    @objc func backBtnClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

