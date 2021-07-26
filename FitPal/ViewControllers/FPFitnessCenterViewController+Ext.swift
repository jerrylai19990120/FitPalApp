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
                fptabbar.recordAnimationView?.stop()
                fptabbar.mineAnimationView?.stop()
                fptabbar.recordAnimationView?.currentFrame = 0
                fptabbar.mineAnimationView?.currentFrame = 0
                fptabbar.homeLabel?.textColor = DefaultBlue
                fptabbar.recordLabel?.textColor = DefaultTabColor
                fptabbar.mineLabel?.textColor = DefaultTabColor
                fptabbar.homeAnimationView?.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce, completion: nil)
                break
            case 1:
                fptabbar.homeAnimationView?.stop()
                fptabbar.mineAnimationView?.stop()
                fptabbar.homeAnimationView?.currentFrame = 0
                fptabbar.mineAnimationView?.currentFrame = 0
                fptabbar.homeLabel?.textColor = DefaultTabColor
                fptabbar.recordLabel?.textColor = DefaultRed
                fptabbar.mineLabel?.textColor = DefaultTabColor
                fptabbar.recordAnimationView?.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce, completion: nil)
                break
            case 2:
                fptabbar.recordAnimationView?.stop()
                fptabbar.homeAnimationView?.stop()
                fptabbar.recordAnimationView?.currentFrame = 0
                fptabbar.homeAnimationView?.currentFrame = 0
                fptabbar.homeLabel?.textColor = DefaultTabColor
                fptabbar.recordLabel?.textColor = DefaultTabColor
                fptabbar.mineLabel?.textColor = DefaultBlue
                fptabbar.mineAnimationView?.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce, completion: nil)
                break
            default:
                break
            }
        }
    }
    
}
