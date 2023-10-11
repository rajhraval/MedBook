//
//  MDTextField.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

enum MDTextFieldInputType {
    case numeric
    case alphaNumeric
    case email
    case secure
    
    var type: UITextContentType {
        switch self {
        case .numeric:
            return .telephoneNumber
        case .alphaNumeric:
            return .name
        case .email:
            return .emailAddress
        case .secure:
            return .password
        }
    }
}

struct MDTextField: View {
    
    var type: MDTextFieldInputType = .alphaNumeric
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.textHint)
                        .foregroundStyle(.primaryTint.opacity(0.5))
                }
                if type == .secure {
                    SecureField("", text: $text)
                        .font(.text)
                        .foregroundStyle(.primaryTint)
                        .textContentType(type.type)
                } else {
                    TextField("", text: $text)
                        .font(.text)
                        .foregroundStyle(.primaryTint)
                        .textContentType(type.type)
                }
            }
            Divider()
        }
        .frame(height: 56)
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 30) {
        MDTextField(type: .email, placeholder: "Email", text: .constant(""))
        MDTextField(type: .secure, placeholder: "Password", text: .constant(""))
    }
}
