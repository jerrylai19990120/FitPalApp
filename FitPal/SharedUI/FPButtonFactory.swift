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
    case buttonWithNoBorderNoIconBlue
    case buttonWithNoBorderLeftIconBlue
    case buttonWithUnderlinedTextNoBorder
    case buttonWithOnlyIcon
    case buttonWithNoBorderNoIconBlack
}

class FPButtonFactory: NSObject {
    
    static let sharedInstance = FPButtonFactory()

    func buttonWithStyle(buttonStyle: FPButtonStyle, text: String?, icon: UIImage?) -> FPButton {
        switch buttonStyle {
        case .buttonWithLeftIconLightMode:
            let button = FPButton(buttonStyle: .buttonWithNoIconDarkMode)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(LabelColor, for: .normal)
            button.setImage(icon, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.layer.borderColor = LabelColor?.cgColor
            button.layer.borderWidth = 1
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
        case .buttonWithNoBorderNoIconBlue:
            let button = FPButton(buttonStyle: .buttonWithNoBorderNoIconBlue)
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(DefaultBlue, for: .normal)
            return button
        case .buttonWithNoBorderLeftIconBlue:
            let button = FPButton(buttonStyle: .buttonWithNoBorderLeftIconBlue)
            button.layer.cornerRadius = 3
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontSmallTitle
            button.setTitleColor(DefaultBlue, for: .normal)
            let img = icon?.withRenderingMode(.alwaysTemplate)
            button.setImage(img, for: .normal)
            button.tintColor = DefaultBlue
            button.imageView?.contentMode = .scaleAspectFit
            return button
        case .buttonWithUnderlinedTextNoBorder:
            let button = FPButton(buttonStyle: .buttonWithUnderlinedTextNoBorder)
            let attrTitle = NSMutableAttributedString(string: text!, attributes: [
                NSAttributedString.Key.font : FontSmall,
                NSAttributedString.Key.foregroundColor : DefaultDarkGray!,
                NSAttributedString.Key.underlineStyle : 1
            ])
            button.setAttributedTitle(attrTitle, for: .normal)
            button.titleLabel?.font = FontSmall
            button.setTitleColor(DefaultDarkGray, for: .normal)
            return button
        case .buttonWithOnlyIcon:
            let button = FPButton(buttonStyle: .buttonWithOnlyIcon)
            let img = icon?.withRenderingMode(.alwaysTemplate)
            button.setImage(img, for: .normal)
            button.tintColor = DefaultBlack
            return button
        case .buttonWithNoBorderNoIconBlack:
            let button = FPButton(buttonStyle: .buttonWithNoBorderNoIconBlack)
            button.setTitle(text, for: .normal)
            button.titleLabel?.font = FontMainThin
            button.setTitleColor(DefaultBlack, for: .normal)
            return button
        }
    }
    
}
