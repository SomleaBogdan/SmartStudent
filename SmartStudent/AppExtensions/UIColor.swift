//
//  UIColor.swift
//  ExchangeApp
//
//  Created by Somlea Felix-Bogdan on 3/14/17.
//  Copyright © 2017 Bogdan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorWith(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
        let color:UIColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1)
        return color
    }
}
