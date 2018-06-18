//
//  ControlsFactory.swift
//  Controls
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public class ControlsFactory {

  public class func build<T: UIView>(_ ofType: ControlType, withParams params: UIParams = UIParams()) -> T {
    switch ofType {
      case .scrollView:
        return buildScrollView(params) as! T

      case .statusBar:
        return buildStatusBar(params) as! T
      
      case .horizontalStack:
        return buildHorizontalStack(params) as! T
      
      case .label:
        return buildLabel(params) as! T
      
      case .button:
        return buildButton(params) as! T
      
      case .textField:
        return buildTextField(params) as! T
      
      case .textFieldStack:
        return buildTextFieldStack(params) as! T
      
      case .textView:
        return buildTextView(params) as! T
        
      case .textViewStack:
        return buildTextViewStack(params) as! T

      case .switchSelector:
        return buildSwitch(params) as! T
      
      case .switchStack:
        return buildSwitchStack(params) as! T

      case .imageViewStack:
        return buildImageViewStack(params) as! T
      
      case .picker:
        return buildPicker(params) as! T
        
      case .pickerStack:
        return buildPickerStack(params) as! T

      default:
          return UIView() as! T
    }
  }
 
  public class func buildScrollView(_ params: UIParams = UIParams()) -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.widthAnchor.constraint(equalToConstant: params.width).isActive = true
    scrollView.backgroundColor = params.backgroundColor
    return scrollView
  }
  
  public class func buildTableView(_ params: UIParams = UIParams()) -> UITableView {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.widthAnchor.constraint(equalToConstant: params.width).isActive = true
    tableView.backgroundColor = params.backgroundColor
    return tableView
  }
  
  public class func buildHorizontalStack(_ params: UIParams = UIParams()) -> Stack {
    params.axis = .horizontal
    let stack = self.buildStack(params)
    return stack
  }
  
  public class func buildVerticalStack(_ params: UIParams = UIParams()) -> Stack {
    params.axis = .vertical
    let stack = self.buildStack(params)
    return stack
  }
  
  public class func buildStack(_ params: UIParams = UIParams()) -> Stack {
    let stack = Stack()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = params.axis!
    stack.distribution = params.distribution!
    stack.alignment = params.alignment!
    stack.spacing = params.spacing
    return stack
  }
  
  public class func buildStatusBar(_ params: UIParams = UIParams()) -> StatusBar {
    let statusBar = StatusBar()
    return statusBar
  }
  
  public class func buildLabel(_ params: UIParams) -> Label {
    let label = Label()
    label.backgroundColor = colorOrLight(params.backgroundColor)
    label.textColor = colorOrDark(params.textColor)
    label.font = labelFontOrDefault(params.fontName, fontSize: params.fontSize)
    label.text = params.text
    return label
  }
  
  public class func buildButton(_ params: UIParams) -> Button {
    let button = Button()
    button.setTitle(params.title, for: .normal)
    button.backgroundColor = colorOrLight(params.backgroundColor)
    button.titleLabel?.textColor = colorOrDark(params.textColor)
    button.titleLabel?.font = textFieldFontOrDefault(params.fontName, fontSize: params.fontSize)
    return button
  }
  
  public class func buildTextField(_ params: UIParams) -> TextField {
    let textField = TextField()
    textField.backgroundColor = colorOrLight(params.backgroundColor)
    textField.textColor = colorOrDark(params.textColor)
    textField.font = textFieldFontOrDefault(params.fontName, fontSize: params.fontSize)
    textField.placeholder = params.placeholder
    return textField
  }
  
  public class func buildTextFieldStack(_ params: UIParams) -> TextFieldStack {
    let textFieldStack = TextFieldStack()
    let title = textFieldStack.title!
    title.textColor = colorOrDark(params.textColor)
    let textField = textFieldStack.textField!
    textFieldStack.backgroundColor = colorOrLight(params.backgroundColor)
    title.text = params.title
    textField.textColor = colorOrDark(params.textColor)
    textField.font = textFieldFontOrDefault(params.fontName, fontSize: params.fontSize)
    textField.placeholder = params.placeholder
    return textFieldStack
  }
  
  public class func buildTextView(_ params: UIParams) -> TextView {
    let textView = TextView()
    textView.backgroundColor = colorOrLight(params.backgroundColor)
    textView.textColor = colorOrDark(params.textColor)
    textView.font = textFieldFontOrDefault(params.fontName, fontSize: params.fontSize)
    return textView
  }
  
  public class func buildTextViewStack(_ params: UIParams) -> TextViewStack {
    let textViewInput = TextViewStack(size: CGSize(width: params.width, height: params.height))
    let title = textViewInput.title!
    let textView = textViewInput.textView!
    textViewInput.titleText = params.title
    title.textColor = colorOrDark(params.textColor)
    textViewInput.backgroundColor = colorOrLight(params.backgroundColor)
    textView.textColor = colorOrDark(params.textColor)
    textView.font = textFieldFontOrDefault(params.fontName, fontSize: params.fontSize)
    textViewInput.text = params.text
    return textViewInput
  }
  
  public class func buildSwitch(_ params: UIParams) -> Switch {
    let switchSelector = Switch()
    switchSelector.backgroundColor = colorOrLight(params.backgroundColor)
    switchSelector.isOn = params.isOn
    switchSelector.onTintColor = params.onColor
    switchSelector.tintColor = params.offColor
    switchSelector.layer.cornerRadius = 16
    switchSelector.backgroundColor = params.offColor
    return switchSelector
  }
  
  public class func buildSwitchStack(_ params: UIParams) -> SwitchStack {
    let switchStack = SwitchStack(title: params.title, titlePlacement: params.titlePlacement)
    switchStack.backgroundColor = colorOrLight(params.backgroundColor)
    switchStack.isOn = params.isOn
    switchStack.onTintColor = params.onColor
    switchStack.tintColor = params.offColor
    switchStack.layer.cornerRadius = 16
    switchStack.backgroundColor = params.offColor
    switchStack.titlePlacement = params.titlePlacement
    return switchStack
  }
  
  public class func buildImageViewStack(_ params: UIParams) -> ImageViewStack {
    let imageViewStack = ImageViewStack(size: CGSize(width: params.width, height: params.height))
    let title = imageViewStack.title!
    title.textColor = colorOrDark(params.textColor)
    let imageView = imageViewStack.imageView!
    imageView.clear(message: "")
    imageViewStack.titleText = params.title
    return imageViewStack
  }
  
  public class func buildPicker(_ params: UIParams) -> Picker {
    let picker = Picker()
    picker.backgroundColor = colorOrLight(params.backgroundColor)
    return picker
  }
  
  public class func buildPickerStack(_ params: UIParams) -> PickerStack {
    let pickerStack = PickerStack(title: params.title, closeButtonText: params.closeText)
    pickerStack.textColor = colorOrDark(params.textColor)
    pickerStack.backgroundColor = colorOrLight(params.backgroundColor)
    return pickerStack
  }

}


