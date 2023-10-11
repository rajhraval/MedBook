//
//  Button+Modifier.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

struct MDButtonShape: ViewModifier {
    
    let style: ButtonActionStyle
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 36)
            .padding(.vertical, 10)
            .background(.white)
            .clipShape(.rect(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style.tint, lineWidth: 3)
            }
    }
}
