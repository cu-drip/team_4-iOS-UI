//
//  ContentView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 01.07.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            var x = 0
        }
    }
}
