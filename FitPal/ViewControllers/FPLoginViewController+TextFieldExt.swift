//
//  LoginViewController+TextFieldExt.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-25.
//

import Foundation
import UIKit
import AuthenticationServices

extension FPLoginViewController: UITextFieldDelegate, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
    }
    
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
