//
//  Button.swift
//  Controls
//
//  Created by Adrian on 12/13/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class Button: UIButton {
  
  var view: UIView!
  public var value: String?
  public var message: Status?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.roundedBorders()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.roundedBorders()
  }
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
  func roundedBorders() {
    self.layer.cornerRadius = 5.0;
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
    self.value = ""
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
    self.layer.borderWidth = 0.2;
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
  
  // MARK: - Validations
  public func validateNonEmpty(message: String = "Cannot be empty") {
    self.unmark()
    guard let value = self.value, !value.isEmpty else {
      self.setErrorMessage(message: message)
      return
    }
  }
  
}
