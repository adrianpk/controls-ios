//
//  SwitchStack.swift
//  Controls
//
//  Created by Adrian on 1/26/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class SwitchStack: Stack  {
  
  public var containerView: UIView!
  public var titleLabel: Label!
  public var switchSelector: Switch!
  public var titlePlacement: titlePlacement = .left
  public var statusTextField: TextField!
  public var title = ""
  public var statusMessage: String?
  public var hSpacing: CGFloat = CGFloat(16)
  public var vSpacing: CGFloat = CGFloat(4)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public convenience init() {
    self.init(frame: CGRect.zero)
    spacing = CGFloat(8.0)
    hSpacing = CGFloat(16.0)
    vSpacing = CGFloat(4.0)
    configStack()
    layout()
  }
  
  public convenience init(title: String = "", titlePlacement: titlePlacement = .left) {
    self.init(frame: CGRect.zero)
    self.title = title
    self.titlePlacement = titlePlacement
//self.titlePlacement = .left
    configStack()
    layout()
    titleLabel.text = title
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configStack() {
    axis = .horizontal
    distribution = UIStackViewDistribution.equalCentering
    alignment = .center
    spacing = CGFloat(8.0)
    hSpacing = CGFloat(16.0)
    vSpacing = CGFloat(4.0)
  }
  
  func layout() {
    translatesAutoresizingMaskIntoConstraints = false
    titleLabel = buildLabel(self.title)
    switchSelector = buildSwitch()
    containerView = buildView()
    arrange()
  }
  
  func arrange() {
    switch titlePlacement {
    case .left:
      containerView.addSubview(titleLabel)
      containerView.addSubview(switchSelector)
      titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
      switchSelector.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: spacing).isActive = true
      //switchSelector.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true

    case .right:
      titleLabel.textAlignment = .left
      containerView.addSubview(switchSelector)
      containerView.addSubview(titleLabel)
      switchSelector.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
      switchSelector.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -(spacing)).isActive = true
      //titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true

    }
    titleLabel.sizeToFit()
    self.addSubview(self.containerView)
    self.addArrangedSubview(self.containerView)
    containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    self.titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    self.titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    self.switchSelector.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    self.switchSelector.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

  }
  
  func arrange2() {
    switch titlePlacement {
      case .left:
        self.alignment = .center
        titleLabel.textAlignment = .right
        addArrangedSubview(titleLabel)
        addArrangedSubview(switchSelector)
        switchSelector.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: spacing).isActive = true
        
      case .right:
        self.alignment = .center
        titleLabel.textAlignment = .left
        addArrangedSubview(switchSelector)
        addArrangedSubview(titleLabel)
        switchSelector.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -(spacing)).isActive = true
    }
  }
  
  func buildLabel(_ text: String = "") -> Label {
    let label = Label(frame: CGRect.zero)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.white
    label.textColor = UIColor.black
    label.font = UIFont.preferredFont(forTextStyle: .title2)
    label.text = text
    return label
  }
  
  func buildSwitch() -> Switch {
    switchSelector = Switch()
    switchSelector.translatesAutoresizingMaskIntoConstraints = false
    switchSelector.backgroundColor = UIColor.white
    return switchSelector
  }
  
  func buildView() -> UIView {
    containerView = UIView()
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.backgroundColor = UIColor.red
    return containerView
  }
  
  public var isOn: Bool {
    get {
      return switchSelector.isOn
    }
    set {
      switchSelector.isOn = newValue
    }
  }
  
  public var onTintColor: UIColor? {
    get {
      return switchSelector.onTintColor
    }
    set {
      switchSelector.onTintColor = newValue
    }
  }
  
  override public var tintColor: UIColor? {
    get {
      return switchSelector.tintColor
    }
    set {
      switchSelector.tintColor = newValue
    }
  }
  

  
}

public enum titlePlacement {
  case left
  case right
}
