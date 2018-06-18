//
//  Status.swift
//  Appetite
//
//  Created by Adrian on 12/5/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public struct Status {

  public var message: String
  public var kind: Kind
  
  public init(message: String, kind: Status.Kind){
    self.message = message
    self.kind = kind
  }
  
  public enum Kind {
    case base
    case info
    case warn
    case error
  
    fileprivate static let colors: [Kind: UIColor] = [
      base: UIColor.init(hexa: 0xCCCCCC),
      info: UIColor.green,
      warn: UIColor.yellow,
      error: UIColor.red,
    ]
    
    public var color: UIColor {
      return Kind.colors[self]!
    }
    
    fileprivate static let complementaryColors: [Kind: UIColor] = [
      base: UIColor.init(hexa: 0x000000),
      info: UIColor.white,
      warn: UIColor.darkGray,
      error: UIColor.white,
      ]
    
    public var complementaryColor: UIColor {
      return Kind.complementaryColors[self]!
    }
    
  }

}
