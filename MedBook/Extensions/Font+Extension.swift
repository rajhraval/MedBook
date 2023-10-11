//
//  Font+Extension.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

extension Font {
    
    static func font(name: FontName, weight: FontWeight, size: FontSize) -> Font {
        custom("\(name.name)\(weight.weight)", fixedSize: size.size)
    }
    
    static let header = font(name: .degular, weight: .bold, size: .header)
    static let title = font(name: .degular, weight: .semibold, size: .title)
    static let button = font(name: .degular, weight: .semibold, size: .button)
    static let text = font(name: .degular, weight: .regular, size: .text)
    static let textHint = font(name: .degular, weight: .regular, size: .textHint)
    
}
