//
//  TextField.swift
//  Controls
//
//  Created by Adrian on 12/12/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension TextField {
  
  public override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y + 8, width: bounds.size.width - 20, height: bounds.size.height - 16);
  }
  
  public override func editingRect(forBounds: CGRect) -> CGRect {
    return self.textRect(forBounds: bounds);
  }

}
