//
//  Picker.swift
//  Controls
//
//  Created by Adrian on 12/22/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class Picker: UIPickerView {

  public var picker: UIPickerView!
  public var _selectionData: [[String]] = [[]]
  public let isLoggingActive = false
  
  public var selectionData: [[String]] {
    get {
      return self._selectionData
    }
    set {
      self._selectionData = newValue
      if isLoggingActive {self.logSelectionData(newValue)}
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.roundedBorders()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.roundedBorders()
  }
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.cgColor
    }
  }
  
  func roundedBorders() {
    self.layer.cornerRadius = 5.0;
  }
  
  func logSelectionData(_ selectionData: [[String]]) {
    print("Selection data for picker: ")
    for item in selectionData {
      print("'\(item)'")
    }
  }
  
}
