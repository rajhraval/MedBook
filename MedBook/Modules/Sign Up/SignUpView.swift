//
//  SignUpView.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SignUpViewModel
    
    init(_ viewModel: SignUpViewModel = SignUpViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack {
                        Text("sign up and continue")
                            .font(.header)
                            .foregroundStyle(.primaryTint.opacity(0.7))
                        Spacer()
                    }
                    VStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            MDTextField(placeholder: "Email", text: $viewModel.email)
                            if !viewModel.isEmailValid && !viewModel.email.isEmpty {
                                Text("Email doesn't seem like a valid.")
                                    .font(.textHint)
                                    .foregroundStyle(.red)
                                    .padding(.leading)
                            }
                        }
                        MDTextField(type: .secure, placeholder: "Password", text: $viewModel.password)
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: viewModel.passwordHas8Characters ? "checkmark.square.fill" : "square")
                                Text("At least 8 characters")
                            }
                            HStack {
                                Image(systemName: viewModel.passwordHasUppercase ? "checkmark.square.fill" : "square")
                                Text("Must contain an uppercase letter")
                            }
                            HStack {
                                Image(systemName: viewModel.passwordHasSpecialChracter ? "checkmark.square.fill" : "square")
                                Text("Contains a special character")
                            }
                        }
                        .font(.text.weight(.semibold))
                        .padding()
                        Spacer()
                    }
                    if viewModel.countryData.isEmpty {
                        ProgressView()
                    } else {
                        Picker("", selection: $viewModel.selectedCountry) {
                            ForEach(Array(viewModel.countryData.keys).sorted(), id: \.self) { key in
                                let countryName = viewModel.countryData[key]?.country ?? ""
                                Text(countryName).tag(key)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 140)
                    }
                    Spacer()
                    MDButton(style: .textWithImage(text: "Let's go", image: "arrow.right")) {
                        viewModel.signUp()
                    }
                    .disabled(!viewModel.isEmailValid && !viewModel.isPasswordValid)
                    .padding(.horizontal, 48)
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden()
        .transparentNavigationBar()
        .navigationTitle("Welcome")
        .navigationDestination(isPresented: $viewModel.showLogin) {
            LoginView()
        }
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
    NavigationStack {
        SignUpView()
    }
}
