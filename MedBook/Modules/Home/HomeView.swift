//
//  HomeView.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI
import SimpleToast

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Which topic interests you today?")
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                        .font(.appTitle)
                        .foregroundStyle(.primaryTint.opacity(0.7))
                    Spacer()
                }
                Spacer()
                MDButton(style: .plainText(text: "Logout", style: .destructive)) {
                    viewModel.logoutUser()
                }
            }
            .navigationTitle("Medbook")
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $viewModel.showLogout) {
                ContentView()
                    .simpleToast(isPresented: $viewModel.showLogout, options: SimpleToastOptions(hideAfter: 2)) {
                        Text("Logged Out Succesfully")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.primaryTint)
                            .clipShape(.capsule)
                    }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
