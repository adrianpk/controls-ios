//
//  ControlsFactory-Arrange.swift
//  Controls
//
//  Created by Adrian on 12/26/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension ControlsFactory {

  public class func arrangeStack(_ stack: UIStackView, into view: UIView, params: UIParams = UIParams()) {
    view.addSubview(stack)
    stack.bindFrameToSuperviewBounds(params.hMargin, params.vMargin)
    stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  public class func arrangeView(_ view: UIView, into containerView: UIView) {
    containerView.addSubview(view)
    view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
  }
  
  public class func arrangeView(_ view: UIView, into stack: UIStackView) {
    stack.addArrangedSubview(view)
    view.leadingAnchor.constraint(equalTo: stack.leadingAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: stack.trailingAnchor).isActive = true
  }
  
  public class func center(_ view: UIView, into containerView: UIView) {
    containerView.addSubview(view)
    view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
  }
  
  public class func arranged1(_ view1: UIView) -> Stack {
    let vStack = ControlsFactory.buildVerticalStack()
    vStack.distribution = .fillProportionally
    vStack.addArrangedSubview(view1)
    view1.leadingAnchor.constraint(equalTo: vStack.leadingAnchor).isActive = true
    view1.trailingAnchor.constraint(equalTo: vStack.trailingAnchor).isActive = true
    return vStack
  }
  
  public class func arranged12(_ view1: UIView, _ view2: UIView, _ view3: UIView) -> Stack {
    let vStack = ControlsFactory.buildVerticalStack()
    vStack.distribution = .fillProportionally
    vStack.addArrangedSubview(view1)
    view1.leadingAnchor.constraint(equalTo: vStack.leadingAnchor).isActive = true
    view1.trailingAnchor.constraint(equalTo: vStack.trailingAnchor).isActive = true
    let hStack = arranged2(view2, view3)
    vStack.addArrangedSubview(hStack)
    hStack.leadingAnchor.constraint(equalTo: vStack.leadingAnchor).isActive = true
    hStack.trailingAnchor.constraint(equalTo: vStack.trailingAnchor).isActive = true
    return vStack
  }
  
  public class func arranged2(_ view1: UIView, _ view2: UIView) -> Stack {
    let hStack = ControlsFactory.buildHorizontalStack()
    hStack.distribution = .fillEqually
    hStack.alignment = .center
    hStack.addArrangedSubview(view1)
    hStack.addArrangedSubview(view2)
    view1.leadingAnchor.constraint(equalTo: hStack.leadingAnchor).isActive = true
    view2.trailingAnchor.constraint(equalTo: hStack.trailingAnchor).isActive = true
    //view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1.0)
    return hStack
  }
  
  public class func arranged21(_ view1: UIView, _ view2: UIView, _ view3: UIView) -> Stack {
    let vStack = ControlsFactory.buildVerticalStack()
    vStack.distribution = .fillProportionally
    let hStack = arranged2(view1, view2)
    hStack.distribution = .fillEqually
    vStack.addArrangedSubview(hStack)
    hStack.leadingAnchor.constraint(equalTo: vStack.leadingAnchor).isActive = true
    hStack.trailingAnchor.constraint(equalTo: vStack.trailingAnchor).isActive = true
    vStack.addArrangedSubview(view3)
    view3.leadingAnchor.constraint(equalTo: vStack.leadingAnchor).isActive = true
    view3.trailingAnchor.constraint(equalTo: vStack.trailingAnchor).isActive = true
    return vStack
  }
  
  public class func arranged122(_ view: UIView, _ view1: UIView, _ view2: UIView, _ view3: UIView, _ view4: UIView) -> Stack {
    let hStack = ControlsFactory.buildHorizontalStack()
    hStack.distribution = .fillEqually
    hStack.addArrangedSubview(view1)
    hStack.addArrangedSubview(view2)
    view1.leadingAnchor.constraint(equalTo: hStack.leadingAnchor).isActive = true
    view2.trailingAnchor.constraint(equalTo: hStack.trailingAnchor).isActive = true
    view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1.0)
    let h2Stack = ControlsFactory.buildHorizontalStack()
    h2Stack.distribution = .fillEqually
    h2Stack.addArrangedSubview(view3)
    h2Stack.addArrangedSubview(view4)
    view3.leadingAnchor.constraint(equalTo: h2Stack.leadingAnchor).isActive = true
    view4.trailingAnchor.constraint(equalTo: h2Stack.trailingAnchor).isActive = true
    view3.widthAnchor.constraint(equalTo: view4.widthAnchor, multiplier: 1.0)
    let vStack = ControlsFactory.buildVerticalStack()
    vStack.addArrangedSubview(view)
    vStack.addArrangedSubview(hStack)
    vStack.addArrangedSubview(h2Stack)
    return vStack
  }
  
  public class func overBluredBackground(_ view: UIView) -> UIView {
    let bluredBackground = UIView(frame: UIScreen.main.bounds)
    bluredBackground.backgroundColor = UIColor.lightGray
    bluredBackground.blured()
    bluredBackground.addSubview(view)
    view.centerXAnchor.constraint(equalTo: bluredBackground.centerXAnchor).isActive = true
    view.centerYAnchor.constraint(equalTo: bluredBackground.centerYAnchor).isActive = true
    return bluredBackground
  }
  
}
