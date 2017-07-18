//
//  DynamicTextHandling.swift
//  airUtilities
//
//  Created by Steven Thompson on 2017-07-18.
//  Copyright © 2017 airg. All rights reserved.
//

import UIKit
import ObjectiveC

// MARK: - DynamicTypeResponsive
public protocol DynamicTypeResponsive {
    /// Sets if the view should redraw and update font size based on a set TextStyle, when the user changes their Dynamic Type setting.
    var respondsToDynamicTypeChanges: Bool { get set }
}

extension UILabel: DynamicTypeResponsive {
    public var respondsToDynamicTypeChanges: Bool {
        set {
            if #available(iOS 10.0, *) {
                self.adjustsFontForContentSizeCategory = newValue
            } else {
                let handler: NotificationHandler = { [weak self] _ in
                    if let strongSelf = self,
                        let style = strongSelf.font.textStyle {
                        strongSelf.font = .preferredFont(forTextStyle: style)
                        strongSelf.invalidateIntrinsicContentSize()
                    }
                }
                self.setContentSizeDidChangeHandler(newValue ? handler : nil)
            }
        }
        get {
            if #available(iOS 10.0, *) {
                return self.adjustsFontForContentSizeCategory
            } else {
                return self.contentSizeNotificationObserver != nil
            }
        }
    }
}

extension UITextView: DynamicTypeResponsive {
    public var respondsToDynamicTypeChanges: Bool {
        set {
            if #available(iOS 10.0, *) {
                self.adjustsFontForContentSizeCategory = newValue
            } else {
                let handler: NotificationHandler = { [weak self] _ in
                    if let strongSelf = self,
                        let style = strongSelf.font?.textStyle {
                        strongSelf.font = .preferredFont(forTextStyle: style)
                        strongSelf.invalidateIntrinsicContentSize()
                    }
                }
                self.setContentSizeDidChangeHandler(newValue ? handler : nil)
            }
        }
        get {
            if #available(iOS 10.0, *) {
                return self.adjustsFontForContentSizeCategory
            } else {
                return self.contentSizeNotificationObserver != nil
            }
        }
    }
}

extension UITextField: DynamicTypeResponsive {
    public var respondsToDynamicTypeChanges: Bool {
        set {
            if #available(iOS 10.0, *) {
                self.adjustsFontForContentSizeCategory = newValue
            } else {
                let handler: NotificationHandler = { [weak self] _ in
                    if let strongSelf = self,
                        let style = strongSelf.font?.textStyle {
                        strongSelf.font = .preferredFont(forTextStyle: style)
                        strongSelf.invalidateIntrinsicContentSize()
                    }
                }
                self.setContentSizeDidChangeHandler(newValue ? handler : nil)
            }
        }
        get {
            if #available(iOS 10.0, *) {
                return self.adjustsFontForContentSizeCategory
            } else {
                return self.contentSizeNotificationObserver != nil
            }
        }
    }
}

extension UIButton: DynamicTypeResponsive {
    public var respondsToDynamicTypeChanges: Bool {
        set {
            self.titleLabel?.respondsToDynamicTypeChanges = newValue
        }
        get {
            return self.titleLabel?.respondsToDynamicTypeChanges ?? false
        }
    }
}

// MARK: - Notification Handling for UIContentSizeCategoryDidChange

typealias NotificationHandler = (Notification) -> Void
var NotificationObserverKey: String = "NotificationObserverKey"

protocol DynamicTypeAdjusting: class {
    /// Sets the handler to be called on `Notification.Name.UIContentSizeCategoryDidChange`
    ///
    /// - Parameter handler: Handler that will be executed on main thread. Set to `nil` to stop receiving updates.
    func setContentSizeDidChangeHandler(_ handler: NotificationHandler?)

    /// Returns the observer of `Notification.Name.UIContentSizeCategoryDidChange`, if it exists.
    var contentSizeNotificationObserver: NSObjectProtocol? { get set }
}

extension DynamicTypeAdjusting {
    func setContentSizeDidChangeHandler(_ handler: NotificationHandler?) {
        if let handler = handler {
            let observer = NotificationCenter.default.addObserver(forName: Notification.Name.UIContentSizeCategoryDidChange,
                                                                  object: nil,
                                                                  queue: OperationQueue.main,
                                                                  using: handler)
            self.contentSizeNotificationObserver = observer
        } else {
            self.contentSizeNotificationObserver = nil
        }
    }

    var contentSizeNotificationObserver: NSObjectProtocol? {
        set {
            withUnsafePointer(to: &NotificationObserverKey) { (p) -> Void in
                objc_setAssociatedObject(self, p, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
        get {
            return withUnsafePointer(to: &NotificationObserverKey) { (p) -> NSObjectProtocol? in
                return objc_getAssociatedObject(self, p) as? NSObjectProtocol
            }
        }
    }
}

extension UILabel: DynamicTypeAdjusting { }
extension UITextField: DynamicTypeAdjusting { }
extension UITextView: DynamicTypeAdjusting { }

// MARK: - UIFont Helpers
extension UIFont {
    public var textStyle: UIFontTextStyle? {
        return self.fontDescriptor.textStyle
    }
}

extension UIFontDescriptor {
    public var textStyle: UIFontTextStyle? {
        guard let fontAttribute = fontAttributes["NSCTFontUIUsageAttribute"] as? String else {
            return nil
        }

        switch fontAttribute {
        case "UICTFontTextStyleHeadline", "AppleSystemUIHeadline":
            return .headline
        case "UICTFontTextStyleSubhead":
            return .subheadline
        case "UICTFontTextStyleBody":
            return .body
        case "UICTFontTextStyleFootnote":
            return .footnote
        case "UICTFontTextStyleCaption1":
            return .caption1
        case "UICTFontTextStyleCaption2":
            return .caption2
        default:
            if #available(iOS 9.0, *) {
                switch fontAttribute {
                case "UICTFontTextStyleCallout":
                    return .callout
                case "UICTFontTextStyleTitle1":
                    return .title1
                case "UICTFontTextStyleTitle2":
                    return .title2
                case "UICTFontTextStyleTitle3":
                    return .title3
                default:
                    fatalError("Style not handled!") // Will need to support new styles added in iOS 11
                }
            }
            fatalError("Style not handled!") // Will need to support new styles added in iOS 11
        }
    }
}
