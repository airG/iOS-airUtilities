//
//  TappableTextView.swift
//  airUtilities
//
//  Created by Steven Thompson on 2018-02-02.
//  Copyright © 2018 airg. All rights reserved.
//

import UIKit

class TappableTextView: UITextView {
    static let UserNameTag: NSAttributedStringKey = NSAttributedStringKey(rawValue: "UserNameTag")
    static let DefaultActionTag: NSAttributedStringKey = NSAttributedStringKey(rawValue: "DefaultActionTag")
    
    // self.attributedText is NSAttributedString!, and crashes on `get` on iOS 8. Set still works, so just set normally and then only return the right string based on iOS version
    override var attributedText: NSAttributedString! {
        set {
            super.attributedText = newValue
            self.hiddenAttributedText = newValue
        }
        
        get {
            if #available(iOS 9.0, *) {
                return super.attributedText
            } else {
                return hiddenAttributedText
            }
        }
    }
    fileprivate var hiddenAttributedText: NSAttributedString!
    
    /// Actions are keyed based on the UserNameTag value in the attributed string...
    ///
    /// So for attribute `[UserNameTag: "stevent"]`, then `actions = ["stevent": ()->()]`
    var actions: [String: (()->Void)] = [:]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        var location = touches.first?.location(in: self)
        location?.x -= textContainerInset.left
        location?.y -= textContainerInset.top
        
        let charIndex = self.layoutManager.characterIndex(for: location!, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        if charIndex < text.count {
            let attrs = attributedText.attributes(at: charIndex, effectiveRange: nil)
            
            if let link = attrs[TappableTextView.UserNameTag] as? String, let action = actions[link] {
                action()
            } else if let action = actions[TappableTextView.DefaultActionTag.rawValue] {
                action()
            }
        }
    }
}
