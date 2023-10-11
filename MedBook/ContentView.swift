//
//  ContentView.swift
//  MedBook
//
//  Created by Raj Raval on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .padding()
            }
            .navigationTitle("Medbook")
            .transparentNavigationBar()
        }
    }
}

#Preview {
    ContentView()
}
