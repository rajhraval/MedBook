//
//  UIFont+Extension.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import UIKit

extension UIFont {
    
    static func custom(name: FontName, weight: FontWeight, size: FontSize) -> UIFont {
        UIFont(name: "\(name.name)\(weight.weight)", size: size.size)!
    }
    
    static let navigationLargeHeader = custom(name: .degular, weight: .semibold, size: .header)
    static let navigationSmallHeader = custom(name: .degular, weight: .semibold, size: .text)
    
}
