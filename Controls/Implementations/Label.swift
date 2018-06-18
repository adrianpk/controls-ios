//
//  Label.swift
//  Controls
//
//  Created by Adrian on 12/24/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

@IBDesignable public class Label: UILabel {

  var view: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }

}
