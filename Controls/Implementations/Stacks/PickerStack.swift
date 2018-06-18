//
//  PickerStack.swift
//  Controls
//
//  Created by Adrian on 1/10/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class PickerStack: Stack, UIGestureRecognizerDelegate {

  var bluredBackground: UIView!
  var containerView: UIView!
  var containerStack: Stack!
  public var title: Label!
  public var picker: Picker!
  public var closeButton: Button!
  public var hSpacing: CGFloat = CGFloat(16)
  public var vSpacing: CGFloat = CGFloat(4)
  public var widthConstraint: NSLayoutConstraint!
  public var heightConstraint: NSLayoutConstraint!
  
  public convenience init() {
    self.init(frame: CGRect.zero)
    self.configStack()
    self.layout()
    self.addGestureRecognizers()
    self.title.text = ""
    self.title.text = ""
  }
  
  public convenience init(title: String? = "", closeButtonText: String = "Close") {
    self.init(frame: CGRect.zero)
    self.configStack()
    self.layout()
    self.addGestureRecognizers()
    self.titleText = title
    self.closeButtonText = closeButtonText
  }

  func configStack() {
    self.axis = .vertical
    self.distribution = .equalSpacing
    self.alignment = .center
  }
  
  func layout() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.bluredBackground = self.buildView(UIScreen.main.bounds)
    bluredBackground.backgroundColor = UX.Palette.selector.uicolor.withAlphaComponent(0.5)
    bluredBackground.blured()
    self.containerView = self.buildView()
    self.roundBorders(self.containerView)
    self.addArrangedSubview(self.bluredBackground)
    self.bluredBackground.addSubview(self.containerView)
    self.containerView.centerXAnchor.constraint(equalTo: bluredBackground.centerXAnchor).isActive = true
    self.containerView.centerYAnchor.constraint(equalTo: bluredBackground.centerYAnchor).isActive = true
    self.bluredBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    self.bluredBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    self.bluredBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
    self.bluredBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    self.title = self.buildLabel()
    self.picker = self.buildPicker()
    self.closeButton = self.buildButton("Close")
    self.containerStack = self.buildStack(axis: .vertical)
    self.containerView.addSubview(self.containerStack)
    self.containerStack.addArrangedSubview(self.title)
    self.containerStack.addArrangedSubview(self.picker)
    self.containerStack.addArrangedSubview(self.closeButton)
    self.widthConstraint = self.containerView.widthAnchor.constraint(equalToConstant: 280)
    self.heightConstraint = self.containerView.heightAnchor.constraint(equalToConstant: 280) //230
    self.widthConstraint.isActive = true
    self.heightConstraint.isActive = true
    self.containerStack.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
    self.containerStack.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true
    self.title.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
    self.title.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    self.title.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8.0).isActive = true
    self.title.widthAnchor.constraint(equalTo: self.containerView.widthAnchor, multiplier: 0.8)
    self.picker.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
    self.picker.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    self.picker.topAnchor.constraint(equalTo: self.title.bottomAnchor).isActive = true
    self.closeButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
    self.closeButton.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
    self.closeButton.topAnchor.constraint(equalTo: self.picker.bottomAnchor).isActive = true
    self.closeButton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8.0).isActive = true
  }

  func addGestureRecognizers() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(closePicker))
    tapRecognizer.delegate = self
    self.closeButton.addGestureRecognizer(tapRecognizer)   
  }

  func closePicker() {
    self.isHidden = true
  }
  
  func buildView(_ frame: CGRect = CGRect.zero) -> UIView {
    let view = UIView(frame: frame)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
  
  func buildLabel() -> Label {
    let label = Label()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    return label
  }
  
  func buildPicker() -> Picker {
    return Picker()
  }

  func buildButton(_ title: String) -> Button {
    let button = Button()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.textAlignment = .center
    button.setTitle(title, for: .normal)
    button.isUserInteractionEnabled = true
    button.clipsToBounds = true
    return button
  }
  
  func buildStack(axis: UILayoutConstraintAxis) -> Stack {
    let stack = Stack()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = axis
    stack.distribution = .fill
    stack.alignment = .fill
    return stack
  }
  
  public var delegate: UIPickerViewDelegate? {
    get {
      return self.picker.delegate
    }
    set {
      self.picker.delegate = newValue
    }
  }
  
  public var dataSource: UIPickerViewDataSource? {
    get {
      return self.picker.dataSource
    }
    set {
      self.picker.dataSource = newValue
    }
  }
  
  public var titleText: String? {
    get {
      return self.title.text
    }
    set {
      self.title.text = newValue
    }
  }
  
  public var closeButtonText: String? {
    get {
      return self.closeButton.titleLabel?.text
    }
    set {
      self.closeButton.setTitle(newValue, for: .normal)
    }
  }
  
  public var textColor: UIColor? {
    get {
      return self.title.textColor
    }
    set {
      self.title.textColor = newValue
      self.closeButton.setTitleColor(newValue, for: .normal)
    }
  }
  
  override public var backgroundColor: UIColor? {
    get {
      return self.title.backgroundColor
    }
    set {
      self.title.backgroundColor = newValue
      self.containerView.backgroundColor = newValue
      self.closeButton.titleLabel?.backgroundColor = newValue
    }
  }
  
  public var width: CGFloat {
    get {
      return self.widthConstraint.constant
    }
    set {
      self.widthConstraint.constant = newValue
    }
  }
  
   public var height: CGFloat {
    get {
      return self.heightConstraint.constant
    }
    set {
      self.heightConstraint.constant = newValue
    }
  }
  
  public var selectionData: [[String]] {
    get {
      return self.picker.selectionData
    }
    set {
      self.picker.selectionData = newValue
    }
  }
  
  public func selectRow(_ row: Int, inComponent: Int, animated: Bool) -> Void {
    return self.picker.selectRow(row, inComponent: inComponent, animated: animated)
  }
  
  public func selectedRow(inComponent: Int) -> Int {
    return self.picker.selectedRow(inComponent: inComponent)
  }
  
  public
  
  func roundBorders(_ view: UIView) {
    view.layer.cornerRadius = 5.0;
  }

}
