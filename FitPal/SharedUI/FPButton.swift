//
//  FPButton.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-23.
//

import UIKit

class FPButton: UIButton {

    var buttonStyle: FPButtonStyle?
    
    init(buttonStyle: FPButtonStyle) {
        super.init(frame: .zero)
        self.buttonStyle = buttonStyle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
