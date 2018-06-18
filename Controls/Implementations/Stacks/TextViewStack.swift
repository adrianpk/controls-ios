//
//  TextViewStack
//  Controls
//
//  Created by Adrian on 1/2/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class TextViewStack: Stack  {

  public var title: Label!
  public var textView: TextView!
  public var textViewFrame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 400))
  public var placeholder: String? = ""
  public var statusTextField: TextField!
  public var hSpacing: CGFloat = CGFloat(16)
  public var vSpacing: CGFloat = CGFloat(4)
  
  public convenience init(title: String = "", text: String = "", placeholder: String = "", size: CGSize?, hSpacing: CGFloat = 16, vSpacing: CGFloat = 4) {
    self.init()
    self.setFrameSize(size)
    self.configStack(hSpacing: hSpacing, vSpacing: vSpacing)
    self.layout()
    self.title.text = title
    self.placeholder = placeholder
    self.configStack(hSpacing: hSpacing, vSpacing: vSpacing)
  }
  
  func setFrameSize(_ size: CGSize?) {
    if let frameSize = size {
      self.textViewFrame = CGRect(origin: CGPoint(x: 0, y: 0), size: frameSize)
    }
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
    self.textView = self.buildTextView()
    self.addArrangedSubview(self.title)
    self.addSubview(self.textView)
    self.addArrangedSubview(self.textView)
    self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.textView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: self.vSpacing).isActive = true
    self.textViewHeight = self.textViewFrame.height
    self.textViewWidth = self.textViewFrame.width
  }
  
  func buildLabel() -> Label {
    let label = Label()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    return label
  }
  
  func buildTextView() -> TextView {
    let textView = TextView(frame: frame)
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textColor = UIColor.black
    textView.font = UIFont.preferredFont(forTextStyle: .body)
    textView.isEditable = true
    textView.isSelectable = true
    textView.isUserInteractionEnabled = true
    textView.isScrollEnabled = false
    textView.clipsToBounds = true
    return textView
  }

  func buildStatusTextField() -> TextField {
    let statusTextField = TextField(frame: CGRect.zero)
    statusTextField.translatesAutoresizingMaskIntoConstraints = false
    statusTextField.backgroundColor = UIColor.clear
    statusTextField.font = UIFont.preferredFont(forTextStyle: .caption1)
    return statusTextField
  }
  
  public var textViewHeight: CGFloat{
    get {
      return self.textView.height
    }
    set {
      self.textView.height = newValue
    }
  }
  
  public var textViewWidth: CGFloat{
    get {
      return self.textView.width
    }
    set {
      self.textView.width = newValue
    }
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
      return self.textView.text
    }
    set {
      self.textView.text = newValue
    }
  }

}
