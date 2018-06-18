//
//  Form.swift
//  Appetite
//
//  Created by Adrian on 12/6/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

public class Form {
  
  public class func status(_ statusArray: [Status]) -> Status.Kind {
    if statusArray.contains(where: {$0.kind == Status.Kind.error}) {
      return  Status.Kind.error
    } else if statusArray.contains(where: {$0.kind == Status.Kind.warn}) {
      return  Status.Kind.warn
    } else if statusArray.contains(where: {$0.kind == Status.Kind.info}) {
      return  Status.Kind.info
    } else {
      return  Status.Kind.base
    }
  }

}
