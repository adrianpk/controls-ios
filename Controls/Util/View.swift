//
//  View.swift
//  Appetite
//
//  Created by Adrian on 11/26/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public class View {

  public class func toggleView(_ view: UIStackView, animate: Bool = false) {
    if animate {
      animateToggleView(view)
    } else {
      view.isHidden = !view.isHidden
      if view.isHidden {
        view.alpha = 0.0
      } else {
        view.alpha = 1.0
      }
    }
  }
  
  public class func animateToggleView(_ view: UIStackView) {
    UIView.animate(withDuration: 0.2, animations: { [unowned view] in
      view.isHidden = !view.isHidden
      if view.isHidden {
        view.alpha = 0.0
      } else {
        view.alpha = 1.0
      }
    })
  }
  
  public class func cellColors(_ isDeEmphasized: Bool, emphasized: UIColor = UIColor.white, deEmphasizedColor: UIColor = UIColor.lightGray) -> (background: UIColor, font: UIColor) {
    switch (isDeEmphasized) {
      case true: return (UX.Palette.cellBackgroundDeemphasized.uicolor, UX.Palette.cellFontDeemphasized.uicolor)
      default: return (UX.Palette.cellBackground.uicolor, UX.Palette.cellFont.uicolor)
    }
  }

}
