//
//  UIViewController+air.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /// Gets the `UINib` named `self.Identifier`
    public static var Nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: Identifier, bundle: bundle)
    }

    /// The string representation of `self`
    public static var Identifier: String {
        return String(describing: self)
    }
}

public extension UIViewController {
    /// If presented by navigation controller, pops self, otherwise dismisses self.
    @objc public func dismissSelf() {
        view.endEditing(false)

        if let _ = presentingViewController, (navigationController == nil || navigationController?.viewControllers.index(of: self) == 0) {
            dismiss(animated: true, completion: nil)
        } else {
            let _ = navigationController?.popViewController(animated: true)
        }
    }

    /// Animates a constraint based on `Notification.Name.UIKeyboardWillChangeFrame` notification.
    ///
    /// - Parameters:
    ///   - notification: Must be a notification from `Notification.Name.UIKeyboardWillChangeFrame`.
    ///   - constraint: Constraint that will animate alongside the keyboard top. Normal use is a constraint to the bottom of the screen.
    func adaptKeyboard(to notification: Notification, constraint: NSLayoutConstraint) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                constraint.constant = 0.0
            } else {
                constraint.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }
}
