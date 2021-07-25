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
        
        //Set up tab bar
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        tabBar.standardAppearance = appearance
        tabBar.isTranslucent = false
        
        /*// Create Animation object
        let jsonName = "home"
        let animation = Animation.named(jsonName)

        // Load animation to AnimationView
        let animationView = AnimationView(animation: animation)
        animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView.loopMode = .loop

        // Add animationView as subview
        self.view.addSubview(animationView)

        // Play the animation
        animationView.play()*/
        
        // Create Tab one
        let tabOne = FPHomeViewController()
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "envelope"), selectedImage: UIImage(systemName: "envelope"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        // Create Tab two
        let tabTwo = FPMineCenterViewController()
        let tabTwoBarItem2 = UITabBarItem(title: "You", image: UIImage(systemName: "envelope"), selectedImage: UIImage(systemName: "envelope"))
            
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
        
    }
}

