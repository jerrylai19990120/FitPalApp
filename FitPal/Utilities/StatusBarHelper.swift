//
//  StatusBarHelper.swift
//  FitPal
//
//  Created by Jerry Lai on 2021-07-23.
//

import Foundation
import UIKit

let GetStatusBarHeight = { () -> CGFloat in
    var statusBarHeight: CGFloat = 0;
    if #available(iOS 13.0, *) {
        let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
        statusBarHeight = (statusBarManager?.statusBarFrame.height)!
    }
    else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}
