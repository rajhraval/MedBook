//
//  View+Modifier.swift
//  MedBook
//
//  Created by Raj Raval on 11/10/23.
//

import SwiftUI

struct TransparentNavigationBar: ViewModifier {
    
    init() {
       setupTransaparentNavigationStyle()
    }
    
    func body(content: Content) -> some View {
        content
    }
    
    private func setupTransaparentNavigationStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear // Set the background color to clear
        appearance.largeTitleTextAttributes = [
            .font: UIFont.navigationLargeHeader,
            .foregroundColor: UIColor(Color.primaryTint),
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        appearance.titleTextAttributes = [
            .font: UIFont.navigationSmallHeader,
            .foregroundColor: UIColor(Color.primaryTint),
            .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle
        ]
        // Apply the appearance to the SwiftUI navigation bar appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    
}
