//
//  LoginView.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

struct LoginView: View {
    
    let fromHome: Bool
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: LoginViewModel
    
    init(fromHome: Bool = false, _ viewModel: LoginViewModel = LoginViewModel()) {
        self.fromHome = fromHome
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        HStack {
                            Text("login into continue")
                                .font(.header)
                                .foregroundStyle(.primaryTint.opacity(0.7))
                            Spacer()
                        }
                        VStack(alignment: .leading, spacing: 30) {
                            MDTextField(placeholder: "Email", text: $viewModel.email)
                            MDTextField(type: .secure, placeholder: "Password", text: $viewModel.password)
                            if let message = viewModel.errorMessage {
                                Text(message)
                                    .font(.textHint)
                                    .foregroundStyle(.red)
                                    .padding(.horizontal)
                            }
                        }
                        Spacer()
                        MDButton(style: .textWithImage(text: "Login", image: "arrow.right")) {
                            viewModel.loginUser()
                        }
                        .padding(.horizontal, 48)
                    }
                    .frame(height: geo.size.height)
                    .padding(.horizontal)
                }
            }
        }
        .transparentNavigationBar()
        .navigationTitle("Welcome")
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $viewModel.showHomeView) {
            HomeView()
        }
        .toolbar {
            if fromHome {
                ToolbarItem(placement: .topBarLeading) {
                    MDButton(style: .image(image: "chevron.left")) {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
