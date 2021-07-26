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
                fptabbar.homeAnimationView?.play()
                fptabbar.recordAnimationView?.play(toFrame: 0)
                fptabbar.mineAnimationView?.play(toFrame: 0)
                break
            case 1:
                fptabbar.recordAnimationView?.play()
                fptabbar.homeAnimationView?.play(toFrame: 0)
                fptabbar.mineAnimationView?.play(toFrame: 0)
                break
            case 2:
                fptabbar.mineAnimationView?.play()
                fptabbar.recordAnimationView?.play(toFrame: 0)
                fptabbar.homeAnimationView?.play(toFrame: 0)
                break
            default:
                break
            }
        }
    }
    
}
