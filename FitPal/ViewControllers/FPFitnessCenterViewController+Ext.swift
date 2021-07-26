//
//  FPFitnessCenterViewController+Ext.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import Foundation
import UIKit
import Lottie

extension FPFitnessCenterViewController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let fptabbar = tabBar as? FPTabBar {
            switch item.tag {
            case 0:
                fptabbar.homeAnimationView?.play(toProgress: 1)
                fptabbar.recordAnimationView?.play(toFrame: 0)
                fptabbar.mineAnimationView?.play(toFrame: 0)
                fptabbar.homeLabel?.textColor = DefaultBlue
                fptabbar.recordLabel?.textColor = DefaultTabColor
                fptabbar.mineLabel?.textColor = DefaultTabColor
                break
            case 1:
                fptabbar.recordAnimationView?.play(toProgress: 1)
                fptabbar.homeAnimationView?.play(toFrame: 0)
                fptabbar.mineAnimationView?.play(toFrame: 0)
                fptabbar.homeLabel?.textColor = DefaultTabColor
                fptabbar.recordLabel?.textColor = DefaultRed
                fptabbar.mineLabel?.textColor = DefaultTabColor
                break
            case 2:
                fptabbar.mineAnimationView?.play(toProgress: 1)
                fptabbar.recordAnimationView?.play(toFrame: 0)
                fptabbar.homeAnimationView?.play(toFrame: 0)
                fptabbar.homeLabel?.textColor = DefaultTabColor
                fptabbar.recordLabel?.textColor = DefaultTabColor
                fptabbar.mineLabel?.textColor = DefaultBlue
                break
            default:
                break
            }
        }
    }
    
}
