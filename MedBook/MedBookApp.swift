//
//  MedBookApp.swift
//  MedBook
//
//  Created by Raj Raval on 10/10/23.
//

import SwiftUI

@main
struct MedBookApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(for: .isLoggedIn) {
                HomeView()
            } else {
                ContentView()
            }
        }
    }
}
