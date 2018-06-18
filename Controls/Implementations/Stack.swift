//
//  Stack.swift
//  Controls
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class Stack: UIStackView {

  var view: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

}
