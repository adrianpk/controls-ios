//
//  TextView.swift
//  Controls
//
//  Created by Adrian on 1/2/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

public class TextView: UITextView {
  
  public var message: Status?
  public var heightConstraint: NSLayoutConstraint?
  public var widthConstraint: NSLayoutConstraint?
  
  override public init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    self.defaultValues()
    self.standardBorder()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.defaultValues()
    self.standardBorder()
  }
  
  func defaultValues(){
    self.inputView?.isUserInteractionEnabled = true
    self.isScrollEnabled = false
    self.isEditable = true
    self.isSelectable = true
    self.isUserInteractionEnabled = true
    self.isOpaque = true
    self.clearsContextBeforeDrawing = true
    self.clipsToBounds = true
    self.autoresizesSubviews = true
  }
  
  public func getStatus() -> Status? {
    return self.message
  }
  
  public func setStatus(_ Status: Status) {
    self.message = Status
  }
  
  public func setInfoMessage(message: String) {
    self.message = Status(message: message, kind: .info)
    self.mark()
  }
  
  public func setWarnMessage(message: String) {
    self.message = Status(message: message, kind: .warn)
    self.mark()
  }
  
  public func setErrorMessage(message: String) {
    self.message = Status(message: message, kind: .error)
    self.mark()
  }
  
  public func clear() {
    self.message = nil
  }
  
  public func mark() {
    if let message = self.message {
      self.layer.borderWidth = 1.0;
      self.layer.cornerRadius = 5.0;
      self.layer.borderColor = message.kind.color.cgColor
    }
  }
  
  public func unmark() {
    self.standardBorder()
  }
  
  public func standardBorder() {
    self.layer.borderWidth = 0.4;
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = Status.Kind.base.color.cgColor
  }
  
  public func messageString() -> String {
    guard let message = self.message else {
      return ""
    }
    return message.message
  }
  
  public func messageKind() -> Status.Kind? {
    guard let message = self.message else {
      return nil
    }
    return message.kind
  }

  // MARK: - Constraints
  var height: CGFloat {
    get {
      switch self.heightConstraint == nil {
      case false:
        return self.heightConstraint!.constant
      default:
        return CGFloat(0)
      }
    }
    set {
      self.heightConstraint = self.heightAnchor.constraint(equalToConstant: newValue)
      self.heightConstraint!.isActive = true
    }
  }
  
  var width: CGFloat {
    get {
      switch self.widthConstraint == nil {
      case false:
        return self.widthConstraint!.constant
      default:
        return CGFloat(0)
      }
    }
    set {
      self.widthConstraint = self.widthAnchor.constraint(equalToConstant: newValue)
      self.widthConstraint!.isActive = true
    }
  }
  
  // MARK: - Validations
  public func validateNonEmpty(message: String = "Cannot be empty") {
    self.unmark()
    guard let text = self.text, !text.isEmpty else {
      self.setErrorMessage(message: message)
      return
    }
  }
  
}
