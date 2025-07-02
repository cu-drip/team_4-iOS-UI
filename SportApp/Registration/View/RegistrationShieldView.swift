//
//  Untitled.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct RegistrationShieldView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        Text("RegistrationShieldView")
        
        Button(action: {
            coordinator.dismissSheet()
            isAuthenticated = true
        }, label: {
            Text("жопа")
        })
    }
}
