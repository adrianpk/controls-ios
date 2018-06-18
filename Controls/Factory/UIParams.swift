//
//  UIParams.swift
//  Controls
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public class UIParams {
  
  // Standard
  public var alignment: UIStackViewAlignment? = .fill
  public var axis: UILayoutConstraintAxis? = .vertical
  public var backgroundColor: UIColor? = nil
  public var bottomLayoutGuideSize = CGFloat(49.0)
  public var bottomMargin = CGFloat(0.0)
  public var closeText: String = ""
  public var distribution: UIStackViewDistribution? = .fill
  public var fontColor: UIColor? = nil
  public var fontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName
  public var fontSize = UIFont.systemFontSize
  public var height = CGFloat(0.0)
  public var hMargin = CGFloat(16.0)
  public var isOn: Bool = false
  public var leftMargin = CGFloat(16.0)
  public var margin = CGFloat(0.0)
  public var navBarHeight = CGFloat(44.0)
  public var offColor: UIColor? = nil
  public var onColor: UIColor? = nil
  public var placeholder: String = ""
  public var rightMargin = CGFloat(16.0)
  public var screenSize: CGRect? = nil
  public var spacing = CGFloat(10.0)
  public var statusBarHeight = CGFloat(0.0)
  public var tabBarHeight = CGFloat(49.0)
  public var text: String = ""
  public var textColor: UIColor? = nil
  public var title: String = ""
  public var titlePlacement: titlePlacement = .left
  public var vMargin = CGFloat(4.0)
  public var topLayoutGuideSize = CGFloat(0.0)
  public var topMargin = CGFloat(0.0)
  public var width = CGFloat(0.0)

  public init() {}
  
}
