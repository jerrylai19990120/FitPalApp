//
//  MainViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-21.
//

import UIKit
import Masonry
import FBSDKLoginKit

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView?
    var pageView: UIPageControl?
    var imageArr = [
        UIImage(named: "Login_Cardio"),
        UIImage(named: "Login_Gym"),
        UIImage(named: "Login_Swimming"),
        UIImage(named: "Login_Biking"),
    ]
    
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = DefaultWhite
        self.setupWelcomeView()
    }
    
    func setUpSlidingPictures() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView!.register(BackgroundCell.self, forCellWithReuseIdentifier: "BackgroundCell")
        collectionView!.backgroundColor = DefaultWhite
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.isScrollEnabled = false
        self.view.addSubview(collectionView!)
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.6, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        collectionView!.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(self.view.frame.height / 2 * 1.1)
        }
        
    }
    
    @objc func changeImage() {
        if counter < imageArr.count {
            self.collectionView?.scrollToItem(at: IndexPath(item: counter, section: self.collectionView!.numberOfSections - 1), at: .centeredHorizontally, animated: true)
            counter += 1
        } else {
            counter = 0
            self.collectionView?.scrollToItem(at: IndexPath(item: counter, section: self.collectionView!.numberOfSections - 1), at: .centeredHorizontally, animated: true)
            counter += 1
        }
    }
    
    func setupWelcomeView() {
        self.setUpSlidingPictures()
        let logo = UIImageView(image: UIImage(named: "FitPal_NoBg"))
        logo.contentMode = .scaleAspectFill
        self.view.addSubview(logo)
        logo.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight())
            make?.width.equalTo()(self.view.frame.width / 3)
            make?.height.equalTo()(66)
            make?.centerX.equalTo()(self.view.mas_centerX)
        }
        
        let welcomeTxt = UILabel()
        welcomeTxt.text = "Welcome"
        welcomeTxt.textColor = DefaultWhite
        welcomeTxt.font = FontLarge
        self.view.addSubview(welcomeTxt)
        
        let detailTxt = UILabel()
        detailTxt.text = "Join FitPal to keep your workout on track"
        detailTxt.textColor = DefaultWhite
        detailTxt.font = FontDetail
        self.view.addSubview(detailTxt)
        
        welcomeTxt.mas_makeConstraints { (make) in
            make?.width.equalTo()(self.view.frame.width * 0.9)
            make?.centerX.equalTo()(self.view.mas_centerX)
            make?.bottom.equalTo()(self.collectionView?.mas_bottom)?.offset()(-self.view.frame.height / 2 * 0.1)
        }
        detailTxt.mas_makeConstraints { (make) in
            make?.width.equalTo()(self.view.frame.width * 0.9)
            make?.centerX.equalTo()(self.view.mas_centerX)
            make?.top.equalTo()(welcomeTxt.mas_bottom)?.offset()(10)
        }
        
        let section = UIStackView()
        section.axis = .vertical
        section.alignment = .center
        section.distribution = .fillEqually
        section.spacing = 8
        
        let label = UILabel()
        label.text = "Already have an account?"
        label.font = FontSmall
        label.textColor = LabelColor
        
        let loginBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoIconDarkMode, text: "Log In", icon: nil)
        loginBtn.backgroundColor = DefaultBlue
        loginBtn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside);
        
        let signUpLabel = UILabel()
        signUpLabel.text = "New to FitPal? Sign up."
        signUpLabel.font = FontSmall
        signUpLabel.textColor = LabelColor
        
        let loginFacebook = FBLoginButton()
        
        let loginGoogle = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithLeftIconLightMode, text: "Continue with Google", icon: UIImage(named: "Google"))
        loginGoogle.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: self.view.frame.width * 0.8)
        
        let loginApple = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithLeftIconLightMode, text: "Continue with Apple", icon: UIImage(named: "Apple"))
        loginApple.imageEdgeInsets = UIEdgeInsets(top: 55, left: 30, bottom: 55, right: self.view.frame.width * 0.8)
        
        let signUpBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithLeftIconLightMode, text: "Sign Up with Email", icon: UIImage(named: "Email"))
        signUpBtn.imageEdgeInsets = UIEdgeInsets(top: 35, left: 30, bottom: 35, right: self.view.frame.width * 0.8)
        
        section.addArrangedSubview(label)
        section.addArrangedSubview(loginBtn)
        section.addArrangedSubview(signUpLabel)
        section.addArrangedSubview(loginFacebook)
        section.addArrangedSubview(loginGoogle)
        section.addArrangedSubview(loginApple)
        section.addArrangedSubview(signUpBtn)
        
        loginBtn.mas_makeConstraints { (make) in
            make?.left.equalTo()(section)?.offset()(18)
            make?.right.equalTo()(section)?.offset()(-18)
        }
        loginFacebook.mas_makeConstraints { (make) in
            make?.left.equalTo()(section)?.offset()(18)
            make?.right.equalTo()(section)?.offset()(-18)
        }
        loginGoogle.mas_makeConstraints { (make) in
            make?.left.equalTo()(section)?.offset()(18)
            make?.right.equalTo()(section)?.offset()(-18)
        }
        loginApple.mas_makeConstraints { (make) in
            make?.left.equalTo()(section)?.offset()(18)
            make?.right.equalTo()(section)?.offset()(-18)
        }
        signUpBtn.mas_makeConstraints { (make) in
            make?.left.equalTo()(section)?.offset()(18)
            make?.right.equalTo()(section)?.offset()(-18)
        }
        
        self.view.addSubview(section)
        section.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.collectionView?.mas_bottom)?.offset()(18)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)?.offset()(-40)
        }
        
    }
    
    @objc func loginBtnClicked() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
}

