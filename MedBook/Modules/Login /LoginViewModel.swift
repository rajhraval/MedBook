//
//  LoginViewModel.swift
//  MedBook
//
//  Created by Raj Raval on 12/10/23.
//

import Foundation
import Combine

enum LoginError {
    case none, emptyFields, loginFailed
}

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var showHomeView = false
    @Published var errorMessage: String? = nil
    
    func loginUser() {
        if email.isEmpty && password.isEmpty {
            errorMessage = "Please add email and password"
        } else {
            let credentialsManager = CredentialsManager()
            do {
                let desiredEmail = try credentialsManager.getEmail()
                let desiredPassword = try credentialsManager.getPassword()
                if email == desiredEmail && password == desiredPassword {
                    showHomeView = true
                    UserDefaults.standard.set(true, for: .isLoggedIn)
                } else {
                    if email != desiredEmail {
                        errorMessage = "Email is incorrect"
                    } else if password != desiredPassword {
                        errorMessage = "Password is incorrect"
                    } else {
                        errorMessage = "Invalid Credentials"
                    }
                }
            } catch let error {
                errorMessage = "Something went wrong"
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
