//
//  ImageView.swift
//  Controls
//
//  Created by Adrian on 1/6/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class ImageView: UIImageView {

  public var message = Status(message: "", kind: .base)
  
  required convenience public init(imageLiteralResourceName name: String) {
    self.init(imageLiteralResourceName: name)
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
  
  public func clear(message: String) {
    self.message = Status(message: "", kind: .base)
  }
  
  public func mark() {
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = self.message.kind.color.cgColor
  }
  
  public func unmark() {
    self.layer.borderWidth = 0.2;
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = Status.Kind.base.color.cgColor
  }
  
  public func messageString() -> String {
    return self.message.message
  }
  
  public func messageKind() -> Status.Kind {
    return self.message.kind
  }
  
  // MARK: - Validations
  //public func validateSomething(message: String = "Cannot be ...") {
  //self.unmark()
  // Do some validation.
  //}
  
}
