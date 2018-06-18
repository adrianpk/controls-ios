//
//  StatusBar.swift
//  Controls
//
//  Created by Adrian on 12/9/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class StatusBar: Stack, UIGestureRecognizerDelegate {

  let showMock = true
  public var messageLabel: UILabel!
  public var messageView: UIView!
  public var messageLabelHeightConstraint: NSLayoutConstraint!
  public var messageViewHeightConstraint: NSLayoutConstraint!
  public var hSpacing: CGFloat = CGFloat(0)
  public var vSpacing: CGFloat = CGFloat(0)
  public var messageColor: UIColor!
  public var status: [Status] = []
  private var isShown: Bool = true

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.layout()
    self.addDismissrecognizer()
    self.showMockStatus()
    self.syncView()
  }
  
  public convenience init(hSpacing: CGFloat = 0, vSpacing: CGFloat = 0) {
    self.init(frame: CGRect.zero)
    self.hSpacing = hSpacing
    self.vSpacing = vSpacing
  }
  
  required public init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func layout() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.messageView = self.buildMessageView()
    self.addArrangedSubview(self.messageView)
    self.messageLabel = self.buildLabel()
    self.messageView.addSubview(self.messageLabel)
    self.messageViewHeightConstraint = self.messageView.heightAnchor.constraint(equalToConstant: 41)
    self.messageViewHeightConstraint.isActive = true
    self.messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    self.messageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    self.messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    self.messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    self.messageLabel.leadingAnchor.constraint(equalTo: self.messageView.leadingAnchor).isActive = true
    self.messageLabel.trailingAnchor.constraint(equalTo: self.messageView.trailingAnchor).isActive = true
    self.messageLabel.centerXAnchor.constraint(equalTo: self.messageView.centerXAnchor).isActive = true
    self.messageLabel.centerYAnchor.constraint(equalTo: self.messageView.centerYAnchor).isActive = true
    self.messageLabelHeightConstraint = self.messageLabel.heightAnchor.constraint(equalToConstant: 21)
    self.messageLabelHeightConstraint.isActive = true
  }
  
  func addDismissrecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
    tapRecognizer.delegate = self
    self.messageView.addGestureRecognizer(tapRecognizer)
  }
  
  public func dismiss() {
    self.hide()
  }
  
  func buildMessageView() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
  
  func buildLabel() -> Label {
    let label = Label(frame: CGRect.zero)
    label.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = Status.Kind.base.color
    label.textColor = Status.Kind.base.complementaryColor
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    label.textAlignment = .center
    return label
  }
  
  func showMockStatus() {
    if showMock {
      let message1 = Status(message: "An error has happened.", kind: .error)
      let message2 = Status(message: "Two in fact.", kind: .error)
      var messages: [Status] = []
      messages.append(message1)
      messages.append(message2)
      self.setStatus(messages)
    }
  }
  
  public func toggle() {
    self.isShown = !self.isShown
    self.syncView()
  }
  
  public func syncView() {
    switch self.isShown {
    case true:
      self.show()
      
    case false:
      self.hide()
    }
  }
  
  public func hasStatus() -> Bool {
    return !self.status.isEmpty
  }
  
  public func showIfStatus() {
    guard hasStatus() else {
      self.hide()
      return
    }
    self.show()
  }
  
  public func show() {
    self.addArrangedSubview(self.messageView)
    self.messageView.isHidden = false
    self.isShown = true
    self.messageView.setNeedsLayout()
    self.flash()
  }
  
  public func hide() {
    self.messageViewHeightConstraint.constant = 0
    self.removeArrangedSubview(self.messageView)
    self.messageView.isHidden = true
    self.isShown = false
  }
  
  func flash(){
    UIView.animate(withDuration: 0.5, delay:0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
      self.messageView.alpha = 1.0
      self.messageViewHeightConstraint.constant = Constant.Size.status_label_height.value + 20
    }, completion: { finished in
      if finished {
        UIView.animate(withDuration: 3.0, delay:2.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
          //self.messageView.alpha = 0.1
        }, completion: { finished in
          if finished {
            //self.hide()
          }
        })
      }
    })
  }
  
  public func clear() {
    self.messageLabel.textColor = Status.Kind.base.complementaryColor
    self.messageView.backgroundColor = Status.Kind.base.color
    self.messageLabelHeightConstraint.constant = Constant.Size.status_label_height.value
    self.messageViewHeightConstraint.constant = Constant.Size.status_label_height.value + 20
  }
  
  public func appendStatus(_ statusMessage: Status, show isShown: Bool = true) {
    self.status.append(statusMessage)
    self.isShown = isShown
    self.updateMessageLabel()
    self.syncView()
  }
  
  public func setStatus(_ statusMessage: Status, show isShown: Bool = true) {
    self.status = [statusMessage]
    self.isShown = isShown
    self.updateMessageLabel()
    self.syncView()
  }
  
  public func setStatus(_ status: [Status], show isShown: Bool = true) {
    self.status = status
    self.isShown = isShown
    self.updateMessageLabel()
    self.syncView()
  }
  
  func updateMessageLabel(){
    var messages = ""
    let lines = self.status.count
    for index in 0..<lines {
      switch index < (lines - 1) {
      case true:
        messages += self.status[index].message + "\n"
      default:
        messages += self.status[index].message
      }
    }
    self.messageLabel.text = messages
    self.updateSize()
    self.updateColors()
  }
  
  func updateSize() {
    let lines = self.status.count
    self.messageLabelHeightConstraint.constant = Constant.Size.status_label_height.value * CGFloat(lines)
    self.messageViewHeightConstraint.constant = self.messageLabelHeightConstraint.constant + 10
  }
  
  func updateColors() {
    let topCondition = self.topCondition()
    self.messageLabel.textColor = topCondition.complementaryColor
    self.messageView.backgroundColor = topCondition.color
  }
  
  func topCondition() -> Status.Kind {
    if self.status.contains(where: {$0.kind == Status.Kind.error}) {
      return  Status.Kind.error
    } else if  self.status.contains(where: {$0.kind == Status.Kind.warn}) {
      return  Status.Kind.warn
    } else if  self.status.contains(where: {$0.kind == Status.Kind.info}) {
      return  Status.Kind.info
    } else {
      return  Status.Kind.base
    }
  }

}
