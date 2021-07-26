//
//  FPFitnessCenterViewController.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import UIKit
import Lottie

class FPFitnessCenterViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    func setupViews() {
        
        //Substitute tab bar
        setValue(FPTabBar(frame: tabBar.frame), forKey: "tabBar")
        
        //Set up tab bar
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance
        tabBar.isTranslucent = false
        
        // Create Tab one
        let homeTab = FPHomeViewController()
        let homeTabBarItem = UITabBarItem(title: "", image: UIImage(), selectedImage: UIImage())
        
        homeTab.tabBarItem = homeTabBarItem
        
        // Create Tab two
        let recordTab = FPRecordViewController()
        let recordTabBarItem = UITabBarItem(title: "", image: UIImage(), selectedImage: UIImage())
            
        recordTab.tabBarItem = recordTabBarItem
        
        // Create Tab three
        let mineTab = FPMineCenterViewController()
        let mineTabBarItem = UITabBarItem(title: "", image: UIImage(), selectedImage: UIImage())
            
        mineTab.tabBarItem = mineTabBarItem
        
        self.viewControllers = [homeTab, recordTab, mineTab]
        
    }
}

