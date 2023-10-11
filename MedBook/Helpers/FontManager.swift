//
//  FontManager.swift
//  MedBook
//
//  Created by Raj Raval on 10/10/23.
//

import SwiftUI

enum FontName: String {
    case degular
    
    var name: String {
        rawValue.capitalized
    }
}

enum FontWeight: String {
    case regular
    case medium
    case semibold
    case bold
    
    var weight: String {
        "-" + rawValue.capitalized
    }
}

enum FontSize: CGFloat {
    case header = 32
    case title = 28
    case button = 22
    case text = 18
    case textHint = 14
    
    var size: CGFloat {
        rawValue
    }
}
