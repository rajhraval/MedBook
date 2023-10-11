//
//  MDButton.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

enum ButtonActionStyle {
    case primary
    case destructive
    
    var tint: Color {
        switch self {
        case .primary:
            return .primaryTint
        case .destructive:
            return .red
        }
    }
}

enum MDButtonStyle {
    case plainText(text: String, style: ButtonActionStyle)
    case bgText(text: String, style: ButtonActionStyle)
    case textWithImage(text: String, image: String, style: ButtonActionStyle)
}

struct MDButton: View {
    
    let style: MDButtonStyle
    let action: () -> Void
    
    var body: some View {
        switch style {
        case .plainText(let text, let style):
            Button(action: {
                action()
            }) {
                Text(text)
                    .font(.button)
                    .foregroundStyle(style.tint)
            }
        case .bgText(let text, let style):
            Button(action: {
                action()
            }) {
                Text(text)
                    .font(.button)
                    .foregroundStyle(style.tint)
            }
            .mdButtonShape(style: style)
        case .textWithImage(let text, let image, let style):
            Button(action: {
                action()
            }) {
                HStack {
                    Text(text)
                    Image(systemName: image)
                }
                .font(.button)
                .foregroundStyle(style.tint)
            }
            .mdButtonShape(style: style)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        MDButton(style: .plainText(text: "Logout", style: .destructive)) {}
        MDButton(style: .bgText(text: "Signup", style: .primary)) {}
        MDButton(style: .textWithImage(text: "Login", image: "arrow.right", style: .primary)) { }
    }
}
