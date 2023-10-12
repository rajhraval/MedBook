//
//  HomeViewModel.swift
//  MedBook
//
//  Created by Raj Raval on 12/10/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var showLogout = false
    
    func logoutUser() {
        showLogout = true
        UserDefaults.standard.set(false, for: .isLoggedIn)
    }
    
}
