//
//  ControlsFactory-Defaults.swift
//  Controls
//
//  Created by Adrian on 12/26/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension ControlsFactory {

  class func colorOrDark(_ color: UIColor?) -> UIColor  {
    return color != nil ? color! : UIColor.black
  }
  
  class func colorOrLight(_ color: UIColor?) -> UIColor  {
    return color != nil ? color! : UIColor.white
  }
  
  class func labelFontOrDefault(_ fontName: String?, fontSize: CGFloat?, fontWeight: CGFloat? = UIFontWeightRegular) -> UIFont  {
    let size = labelFontSizeOrDefault(ofSize: fontSize)
    let weight = fontWeightOrDefault(ofWeight: fontWeight)
    guard let _ = fontName else {
      return UIFont.systemFont(ofSize: size, weight: weight)
    }
    guard let font = UIFont(name: fontName!, size: fontSize!) else {
      return UIFont.systemFont(ofSize: size, weight: weight)
    }
    return font
  }
  
  class func labelFontSizeOrDefault(ofSize fontSize: CGFloat?) -> CGFloat  {
    guard let _ = fontSize else {
      return UIFont.labelFontSize
    }
    return fontSize!
  }
  
  class func textFieldFontOrDefault(_ fontName: String?, fontSize: CGFloat?, fontWeight: CGFloat? = UIFontWeightRegular) -> UIFont  {
    let size = textFontSizeOrDefault(ofSize: fontSize)
    let weight = fontWeightOrDefault(ofWeight: fontWeight)
    guard let _ = fontName else {
      return UIFont.systemFont(ofSize: size, weight: weight)
    }
    guard let font = UIFont(name: fontName!, size: fontSize!) else {
      return UIFont.systemFont(ofSize: size, weight: weight)
    }
    return font
  }
  
  class func textFontSizeOrDefault(ofSize fontSize: CGFloat?) -> CGFloat  {
    guard let _ = fontSize else {
      return UIFont.systemFontSize
    }
    return fontSize!
  }
  
  class func fontWeightOrDefault(ofWeight fontWeight: CGFloat?) -> CGFloat  {
    guard let _ = fontWeight else {
      return UIFontWeightRegular
    }
    return fontWeight!
  }

}
