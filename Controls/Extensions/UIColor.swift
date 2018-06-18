//
//  UIColor.swift
//  Appetite
//
//  Created by Adrian on 12/1/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit



extension UIColor {
  
  convenience init(hexa: Int) {
    let components = (
      R: CGFloat((hexa >> 16) & 0xff) / 255,
      G: CGFloat((hexa >> 08) & 0xff) / 255,
      B: CGFloat((hexa >> 00) & 0xff) / 255
    )
    self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
  }
}

