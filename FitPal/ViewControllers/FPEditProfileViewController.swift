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
    var avatarView: UIImageView?
    var surnameField: FPTextField?
    var firstNameField: FPTextField?
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Profile"
        
        cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnPressed))
        self.navigationItem.leftBarButtonItem = cancelBtn
        
        saveBtn = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveBtnPressed))
        self.navigationItem.rightBarButtonItem = saveBtn
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        hStack.alignment = .center
        hStack.spacing = 18
        
        avatarView = UIImageView(image: UIImage(named: "anon"))
        avatarView?.layer.cornerRadius = 30
        avatarView?.clipsToBounds = true
        avatarView?.layer.borderWidth = 1
        avatarView?.layer.borderColor = DefaultBlue?.cgColor
        hStack.addArrangedSubview(avatarView!)
        avatarView?.mas_makeConstraints({ (make) in
            make?.height.equalTo()(60)
            make?.width.equalTo()(60)
        })
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .center
        vStack.spacing = 2
        
        surnameField = FPTextField()
        surnameField?.text = "Lai"
        surnameField?.layer.backgroundColor = DefaultWhite?.cgColor
        surnameField?.borderStyle = .none
        surnameField?.clearButtonMode = .whileEditing
        
        firstNameField = FPTextField()
        firstNameField?.text = "Jerry"
        firstNameField?.layer.backgroundColor = DefaultWhite?.cgColor
        firstNameField?.borderStyle = .none
        firstNameField?.clearButtonMode = .whileEditing
        
        vStack.addArrangedSubview(firstNameField!)
        vStack.addArrangedSubview(surnameField!)
        surnameField?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.7)
        })
        firstNameField?.mas_makeConstraints({ (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.7)
        })
        
        hStack.addArrangedSubview(vStack)
        vStack.mas_makeConstraints { (make) in
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.6)
            make?.height.equalTo()(80)
        }
        
        self.view.addSubview(hStack)
        hStack.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!)
            make?.left.equalTo()(self.view)?.offset()(16)
            make?.height.equalTo()(120)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.9)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(FPBioCell.self, forCellWithReuseIdentifier: FPBioCell.identifier)
        collectionView?.register(FPHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FPHeaderCollectionView.identifier)
        collectionView?.register(FPHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FPHeaderCollectionView.identifier)
        self.view.addSubview(collectionView!)
        collectionView?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(hStack.mas_bottom)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.bottom.equalTo()(self.view)
        })
    }
    
    @objc func cancelBtnPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveBtnPressed() {
        
    }

}
