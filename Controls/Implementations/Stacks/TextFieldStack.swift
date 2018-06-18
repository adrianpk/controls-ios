//
//  TextFieldStack
//  Controls
//
//  Created by Adrian on 12/25/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class TextFieldStack: Stack  {
  
  public var title: Label!
  public var textField: TextField!
  public var statusTextField: TextField!
  public var statusMessage: String?
  public var hSpacing: CGFloat = CGFloat(16)
  public var vSpacing: CGFloat = CGFloat(4)

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public convenience init() {
    self.init(frame: CGRect.zero)
    self.layout()
    self.axis = .vertical
    self.distribution = .fill
    self.alignment = .fill
    self.hSpacing = 16
    self.vSpacing = 4
    self.title.text = ""
    self.textField.text = ""
  }
  
  public convenience init(title: String = "", textFieldText: String = "",  textFieldPlaceholder: String = "", hSpacing: CGFloat = 16, vSpacing: CGFloat = 4) {
    self.init(frame: CGRect.zero)
    self.layout()
    self.configStack(hSpacing: hSpacing, vSpacing: vSpacing)
    self.title.text = title
    self.textField.text = textFieldText
    self.textField.placeholder = textFieldPlaceholder
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configStack(hSpacing: CGFloat, vSpacing: CGFloat) {
    self.axis = .vertical
    self.distribution = .fill
    self.alignment = .fill
    self.hSpacing = hSpacing
    self.vSpacing = vSpacing
  }
  
  func layout() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.title = self.buildLabel()
    self.textField = self.buildTextField()
    self.addArrangedSubview(self.title)
    self.addArrangedSubview(self.textField)
    self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.textField.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: self.vSpacing)
  }
  
  func buildLabel() -> Label {
    let label = Label(frame: CGRect.zero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    return label
  }
  
  func buildTextField() -> TextField {
    textField = TextField(frame: CGRect.zero)
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = UIColor.white
    textField.textColor = UIColor.black
    textField.font = UIFont.preferredFont(forTextStyle: .body)
    return textField
  }
  
  func buildStatusTextField() -> TextField {
    statusTextField = TextField(frame: CGRect.zero)
    statusTextField.translatesAutoresizingMaskIntoConstraints = false
    statusTextField.backgroundColor = UIColor.clear
    statusTextField.textColor = UIColor.red
    statusTextField.font = UIFont.preferredFont(forTextStyle: .caption1)
    return statusTextField
  }
  
  public func clear() {
    self.textField.clear()
  }
  
  public var titleText: String! {
    get {
      return self.title.text
    }
    set {
      self.title.text = newValue
    }
  }
  
  public var text: String! {
    get {
      return self.textField.text
    }
    set {
      self.textField.text = newValue
    }
  }
  
  public var placeholder: String! {
    get {
      return self.textField.placeholder
    }
    set {
      self.textField.placeholder = newValue
    }
  }

}

