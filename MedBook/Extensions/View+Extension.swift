//
//  View+Extension.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

extension View {
    
    func mdButtonShape(style: ButtonActionStyle) -> some View {
        modifier(MDButtonShape(style: style))
    }
    
    func transparentNavigationBar() -> some View {
        modifier(TransparentNavigationBar())
    }
    
}
