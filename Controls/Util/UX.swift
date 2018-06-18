//
//  UX
//  Appetite
//
//  Created by Adrian on 12/1/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public class UX {

  enum Palette {
    case viewBackground
    case selector
    case buttonTextLight
    case segue
    case action
    case cellBackground
    case cellFont
    case cellBackgroundHighlighted
    case cellFontHighlighted
    case cellBackgroundDeemphasized
    case cellFontDeemphasized
    
    
    fileprivate static let value: [Palette: UIColor] = [
      viewBackground: UIColor(hexa: 0xFFFFFF),
      buttonTextLight: UIColor.white,
      selector: UIColor(hexa: 0xFF318F),
      segue: UIColor(hexa: 0x0099F7),
      action: UIColor(hexa: 0x9642F4),
      cellBackground: UIColor(hexa: 0xFFFFFF),
      cellFont: UIColor(hexa: 0x000000),
      cellBackgroundHighlighted: UIColor(hexa: 0xBBF853),
      cellFontHighlighted: UIColor(hexa: 0xFF221B),
      cellBackgroundDeemphasized: UIColor(hexa: 0xEBEBEB),
      cellFontDeemphasized: UIColor(hexa: 0x797979),
      ]
    
    var uicolor: UIColor {
      return Palette.value[self]!;
    }
    
    var cgcolor: CGColor {
      return Palette.value[self]!.cgColor;
    }
  }

}
