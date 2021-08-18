//
//  FPCommentViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-08-17.
//

import UIKit
import MapKit

class FPCommentViewController: UIViewController {
    
    var map: MKMapView?
    var infoLabel: UILabel?
    var titleLabel: UILabel?
    var name: String?
    var date: String?
    var dist: String?
    var commentField: FPTextField?
    var sendBtn: FPButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = DefaultLightGray
        self.navigationController?.navigationBar.barTintColor = DefaultWhite
        self.navigationItem.title = "Discussion"
        
        map = MKMapView()
        map?.showsUserLocation = false
        map?.mapType = .standard
        map?.isScrollEnabled = false
        map?.isZoomEnabled = false
        map?.delegate = self
        self.view.addSubview(map!)
        map?.mas_makeConstraints({ (make) in
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.top.equalTo()(self.view)?.offset()(GetStatusBarHeight() + (self.navigationController?.navigationBar.frame.height)!)
            make?.height.equalTo()(120)
        })
        
        let section = UIView()
        section.backgroundColor = DefaultWhite
        
        titleLabel = UILabel()
        titleLabel?.text = "Morning Run"
        titleLabel?.font = FontMain
        
        name = "Jerry Lai"
        date = "Aug 16, 2021"
        dist = "10.18 km"
        infoLabel = UILabel()
        infoLabel?.text = "\(name ?? "") • \(date ?? "") • \(dist ?? "")"
        infoLabel?.font = FontTiny
        infoLabel?.textColor = DefaultTabColor
        
        section.addSubview(titleLabel!)
        section.addSubview(infoLabel!)
        titleLabel?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(section)?.offset()(30)
            make?.centerX.equalTo()(section.mas_centerX)
        })
        
        infoLabel?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(titleLabel?.mas_bottom)?.offset()(12)
            make?.centerX.equalTo()(section.mas_centerX)
        })
        
        self.view.addSubview(section)
        section.mas_makeConstraints { (make) in
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.top.equalTo()(map?.mas_bottom)
            make?.height.equalTo()(110)
        }
        
        let inputField = UIView()
        inputField.backgroundColor = DefaultWhite
        inputField.layer.borderWidth = 1
        inputField.layer.borderColor = DefaultLightGray?.cgColor
        self.view.addSubview(inputField)
        inputField.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(self.view)
            make?.left.equalTo()(self.view)
            make?.right.equalTo()(self.view)
            make?.height.equalTo()(50)
        }
        
        commentField = FPTextField()
        commentField?.clearButtonMode = .whileEditing
        commentField?.borderStyle = .none
        commentField?.placeholder = "Add a comment"
        
        sendBtn = FPButtonFactory.sharedInstance.buttonWithStyle(buttonStyle: .buttonWithNoBorderNoIconBlack, text: "Send", icon: nil)
        sendBtn?.setTitleColor(DefaultDarkGray, for: .normal)
        sendBtn?.titleLabel?.font = FontSmallTitle
        
        inputField.addSubview(sendBtn!)
        inputField.addSubview(commentField!)
        commentField?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(inputField)
            make?.left.equalTo()(inputField)
            make?.bottom.equalTo()(inputField)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.8)
        })
        sendBtn?.mas_makeConstraints({ (make) in
            make?.top.equalTo()(inputField)
            make?.right.equalTo()(inputField)
            make?.bottom.equalTo()(inputField)
            make?.width.equalTo()(UIScreen.main.bounds.width * 0.2)
        })
        
    }

}
