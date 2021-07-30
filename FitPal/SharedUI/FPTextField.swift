//
//  FPTextField.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-30.
//

import UIKit

class FPTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 5)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
