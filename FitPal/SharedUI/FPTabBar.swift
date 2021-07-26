//
//  FPTabBar.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import UIKit
import Masonry
import Lottie

class FPTabBar: UITabBar {
    
    let animationNames = ["home", "record", "mineCenter"]
    var homeAnimationView: AnimationView?
    var recordAnimationView: AnimationView?
    var mineAnimationView: AnimationView?
    var homeLabel: UILabel?
    var recordLabel: UILabel?
    var mineLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for index in 0..<self.items!.count {
            self.setupAnimationView(index: index)
        }
    }
    
    func gettabBarButtonsArray() -> [UIView] {
        var buttonsArr: [UIView] = []
        
        for subview in self.subviews {
            if buttonsArr.count == 3 {
                break
            }
            if String(describing: type(of: subview)) == "UITabBarButton" {
                buttonsArr.append(subview)
            }
            
        }
        
        return buttonsArr
    }
    
    func setupAnimationView(index: Int) {
        let tabBarButton = gettabBarButtonsArray()[index]
        let tabBarItem = self.items![index]
        tabBarItem.tag = index
        
        // Create Animation object
        let jsonName = self.animationNames[index]
        let animation = Animation.named(jsonName)
        
        if index == 0 {
            // Load animation to AnimationView
            homeAnimationView = AnimationView(animation: animation)
            homeAnimationView?.loopMode = .playOnce
            homeAnimationView?.isUserInteractionEnabled = false

            // Add animationView as subview
            tabBarButton.addSubview(homeAnimationView!)
            
            // Play the animation
            homeAnimationView?.play(toFrame: 0)
            
            homeAnimationView?.mas_makeConstraints { (make) in
                make?.height.equalTo()(70)
                make?.width.equalTo()(70)
                make?.centerX.equalTo()(tabBarButton)
                make?.centerY.equalTo()(tabBarButton)?.offset()(4)
            }
            
            //Set up tab label
            homeLabel = UILabel()
            homeLabel?.text = "Home"
            homeLabel?.textColor = DefaultTabColor
            homeLabel?.font = FontTiny
            tabBarButton.addSubview(homeLabel!)
            homeLabel?.mas_makeConstraints({ (make) in
                make?.top.equalTo()(homeAnimationView?.mas_bottom)?.offset()(-20)
                make?.centerX.equalTo()(homeAnimationView?.mas_centerX)
            })
            
            if tabBarItem == self.selectedItem {
                homeAnimationView?.play()
                homeLabel?.textColor = DefaultBlue
            }
        } else if index == 1 {
            // Load animation to AnimationView
            recordAnimationView = AnimationView(animation: animation)
            recordAnimationView?.loopMode = .playOnce
            recordAnimationView?.isUserInteractionEnabled = false

            // Add animationView as subview
            tabBarButton.addSubview(recordAnimationView!)
            
            // Play the animation
            recordAnimationView?.play(toFrame: 0)
            
            recordAnimationView?.mas_makeConstraints { (make) in
                make?.height.equalTo()(70)
                make?.width.equalTo()(70)
                make?.centerX.equalTo()(tabBarButton)
                make?.centerY.equalTo()(tabBarButton)?.offset()(4)
            }
            
            recordLabel = UILabel()
            recordLabel?.text = "Record"
            recordLabel?.textColor = DefaultTabColor
            recordLabel?.font = FontTiny
            tabBarButton.addSubview(recordLabel!)
            recordLabel?.mas_makeConstraints({ (make) in
                make?.top.equalTo()(recordAnimationView?.mas_bottom)?.offset()(-20)
                make?.centerX.equalTo()(recordAnimationView?.mas_centerX)
            })
            
            if tabBarItem == self.selectedItem {
                recordAnimationView?.play()
                recordLabel?.textColor = DefaultBlue
            }
        } else if index == 2 {
            // Load animation to AnimationView
            mineAnimationView = AnimationView(animation: animation)
            mineAnimationView?.loopMode = .playOnce
            mineAnimationView?.isUserInteractionEnabled = false

            // Add animationView as subview
            tabBarButton.addSubview(mineAnimationView!)
            
            // Play the animation
            mineAnimationView?.play(toFrame: 0)
            
            mineAnimationView?.mas_makeConstraints { (make) in
                make?.height.equalTo()(70)
                make?.width.equalTo()(70)
                make?.centerX.equalTo()(tabBarButton)
                make?.centerY.equalTo()(tabBarButton)?.offset()(4)
            }
            
            mineLabel = UILabel()
            mineLabel?.text = "You"
            mineLabel?.textColor = DefaultTabColor
            mineLabel?.font = FontTiny
            tabBarButton.addSubview(mineLabel!)
            mineLabel?.mas_makeConstraints({ (make) in
                make?.top.equalTo()(mineAnimationView?.mas_bottom)?.offset()(-20)
                make?.centerX.equalTo()(mineAnimationView?.mas_centerX)?.offset()(-1)
            })
            
            if tabBarItem == self.selectedItem {
                mineAnimationView?.play()
                mineLabel?.textColor = DefaultBlue
            }
        }
        
    }

}
