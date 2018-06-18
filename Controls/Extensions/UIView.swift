//
//  UIView.swift
//  Controls
//
//  Created by Adrian on 12/12/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension UIView {

  @discardableResult
  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
    return view
  }
  
  func blured(_ style: UIBlurEffectStyle = UIBlurEffectStyle.dark) {
    if !UIAccessibilityIsReduceTransparencyEnabled() {
      let blurEffect = UIBlurEffect(style: style)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = self.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      blurEffectView.alpha = 0.8
      self.addSubview(blurEffectView)
    } else {
      self.backgroundColor = UIColor.gray
    }
  }

  public func bindFrameToSuperviewBounds(_ hMargin: CGFloat = 0, _ vMargin: CGFloat = 0 ) {
    guard let superview = self.superview else {
      print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
      return
    }
    
    self.translatesAutoresizingMaskIntoConstraints = false
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(hMargin)-[subview]-\(hMargin)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(vMargin)-[subview]-\(vMargin)-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
  }

}
