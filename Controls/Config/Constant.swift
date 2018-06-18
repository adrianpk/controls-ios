//
//  Constant.swift
//  Controls
//
//  Created by Adrian on 12/12/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation

class Constant{
  
  enum Size {
    case status_label_height
    
    fileprivate static let values: [Size: CGFloat] = [
      status_label_height: 21.0,
    ]
    
    var value: CGFloat {
      return Size.values[self]!
    }
  }

}

