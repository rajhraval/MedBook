//
//  LoginView.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                MDButton(style: .image(image: "chevron.left")) {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
