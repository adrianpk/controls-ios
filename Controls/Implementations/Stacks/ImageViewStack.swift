//
//  ImageViewStack.swift
//  Controls
//
//  Created by Adrian on 1/6/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class ImageViewStack: Stack, UIGestureRecognizerDelegate {
  
  public var title: Label!
  public var imageView: ImageView!
  public var imageViewFrame: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 400))
  public var buttonsStack: Stack!
  public var takePictureButton: Button!
  public var selectImageButton: Button!
  public var deleteImageButton: Button!
  public var statusTextField: TextField!
  public var hSpacing: CGFloat = CGFloat(16)
  public var vSpacing: CGFloat = CGFloat(4)
  public var buttonsStackSpacing: CGFloat = CGFloat(8)
  
  public convenience init(title: String? = "", size: CGSize?, hSpacing: CGFloat = 16, vSpacing: CGFloat = 4) {
    self.init()
    self.setFrameSize(size)
    self.configStack(hSpacing: hSpacing, vSpacing: vSpacing)
    self.layout()
    self.addGestureRecognizers()
    self.titleText = title
  }
  
  func configStack(hSpacing: CGFloat, vSpacing: CGFloat) {
    self.axis = .vertical
    self.distribution = .fill
    self.alignment = .fill
    self.hSpacing = hSpacing
    self.vSpacing = vSpacing
  }
  
  func setFrameSize(_ size: CGSize?) {
    if let frameSize = size {
      self.imageViewFrame = CGRect(origin: CGPoint(x: 0, y: 0), size: frameSize)
    }
  }
  
  func layout() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.title = self.buildLabel()
    self.addArrangedSubview(self.title)
    self.imageView = self.buildImageView()
    self.takePictureButton = self.buildButton("📷")
    self.selectImageButton = self.buildButton("🖼")
    self.deleteImageButton = self.buildButton("❌")
    self.buttonsStack = self.buildStack(axis: .horizontal)
    self.buttonsStack.addArrangedSubview(self.takePictureButton)
    self.buttonsStack.addArrangedSubview(self.selectImageButton)
    self.buttonsStack.addArrangedSubview(self.deleteImageButton)
    self.addArrangedSubview(self.imageView)
    self.addArrangedSubview(self.buttonsStack)
    self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    self.imageView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: self.vSpacing).isActive = true
  }

  func addGestureRecognizers() {
    /*let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(closePicker))*/
    /*tapRecognizer.delegate = self*/
    /*self.closeButton.addGestureRecognizer(tapRecognizer)   */
  }
  
  func buildLabel() -> Label {
    let label = Label()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    return label
  }
  
  func buildImageView() -> ImageView {
    let imageView = ImageView(frame: frame)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.isUserInteractionEnabled = true
    imageView.clipsToBounds = true
    return imageView
  }
  
  func buildButton(_ title: String) -> Button {
    let button = Button()
    button.setTitle(title, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isUserInteractionEnabled = true
    button.clipsToBounds = true
    return button
  }

  func buildStack(axis: UILayoutConstraintAxis) -> Stack {
    let stack = Stack()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = axis
    stack.distribution = .fillEqually
    stack.alignment = .fill
    stack.spacing = self.buttonsStackSpacing
    return stack
  }

  func buildStatusTextField() -> TextField {
    let statusTextField = TextField(frame: CGRect.zero)
    statusTextField.translatesAutoresizingMaskIntoConstraints = false
    statusTextField.backgroundColor = UIColor.clear
    statusTextField.font = UIFont.preferredFont(forTextStyle: .caption1)
    return statusTextField
  }
  
  public var titleText: String? {
    get {
      return self.title.text
    }
    set {
      self.title.text = newValue
    }
  }
  
}
