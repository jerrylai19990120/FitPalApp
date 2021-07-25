//
//  LoginViewController+TextFieldExt.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import Foundation
import UIKit

extension FPLoginViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.checkIfBothFieldFilled()
    }
    
    func checkIfBothFieldFilled() {
        if self.emailField?.text != "" && self.passwordField?.text != "" {
            self.loginBtn?.isEnabled = true
            self.loginBtn?.setTitleColor(DefaultBlue, for: .normal)
        } else {
            self.loginBtn?.isEnabled = false
            self.loginBtn?.setTitleColor(DefaultDarkGray, for: .normal)
        }
    }
    
}
