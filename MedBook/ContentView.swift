//
//  ContentView.swift
//  MedBook
//
//  Created by Raj Raval on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSignup = false
    @State private var showLogin = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Image(.landing)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    HStack {
                        MDButton(style: .bgText(text: "Signup")) {
                            showSignup.toggle()
                        }
                        MDButton(style: .bgText(text: "Login")) {
                            showLogin.toggle()
                        }
                    }
                    .padding(.horizontal, 36)
                    .padding(.bottom)
                }
            }
            .navigationDestination(isPresented: $showLogin) {
                LoginView()
            }
            .navigationDestination(isPresented: $showSignup) {
                SignUpView()
            }
            .navigationTitle("Medbook")
            .transparentNavigationBar()
        }
    }
}

#Preview {
    ContentView()
}
