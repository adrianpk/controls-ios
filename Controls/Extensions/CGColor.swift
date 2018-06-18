//
//  CGColor.swift
//  Appetite
//
//  Created by Adrian on 12/1/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension CGColor {
  
  class func colorWithHex(_ hexa: Int) -> CGColor {
    return UIColor(hexa: hexa).cgColor
  }

}

