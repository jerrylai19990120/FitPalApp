//
//  FPButtonFactory.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-23.
//

import UIKit

enum FPButtonStyle {
    case buttonWithLeftIconLightMode
    case buttonWithRightIconLightMode
    case buttonWithNoIconLightMode
    case buttonWithLeftIconDarkMode
    case buttonWithRightIconDarkMode
    case buttonWithNoIconDarkMode
}

class FPButtonFactory: NSObject {
    
    static let sharedInstance = FPButtonFactory()

    func buttonWithStyle(buttonStyle: FPButtonStyle, text: String, icon: UIImage?) -> FPButton {
        switch buttonStyle {
        case .buttonWithLeftIconLightMode:
            let button = FPButton(buttonStyle: .buttonWithNoIconDarkMode)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(DefaultWhite, for: .normal)
            button.setImage(icon, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        case .buttonWithRightIconLightMode:
            return FPButton(buttonStyle: .buttonWithRightIconLightMode)
        case .buttonWithNoIconLightMode:
            let button = FPButton(buttonStyle: .buttonWithNoIconLightMode)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(LabelColor, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = LabelColor?.cgColor
            return button
        case .buttonWithLeftIconDarkMode:
            let button = FPButton(buttonStyle: .buttonWithNoIconDarkMode)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(DefaultWhite, for: .normal)
            button.setImage(icon, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            return button
        case .buttonWithRightIconDarkMode:
            return FPButton(buttonStyle: .buttonWithRightIconDarkMode)
        case .buttonWithNoIconDarkMode:
            let button = FPButton(buttonStyle: .buttonWithNoIconDarkMode)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(DefaultWhite, for: .normal)
            return button
        }
    }
    
}
