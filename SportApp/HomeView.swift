//
//  HomeView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var coordinator = Coordinator()
    @State var isAuthenticated: Bool = false
    
    var body: some View {
        Group {
            if !isAuthenticated {
                RegistrationView()
                    .environmentObject(coordinator)
            } else {
                tabbar
            }
        }
        .fullScreenCover(item: $coordinator.presentedSheet) { sheet in
            sheetView(for: sheet)
                .interactiveDismissDisabled(true)
        }
    }
    
    var tabbar: some View {
        TabView {
            NavigationStack() {
                TournirsListView()
            }
            .tabItem {
                Label("Главная", systemImage: "house.fill")
            }
            .tag(0) // исправить потом

            NavigationStack() {
                EmptyView()
            }
            .tabItem {
                Label("Профиль", systemImage: "map.fill")
            }
            .tag(1)
        }
    }
    
    @ViewBuilder
    func sheetView(for sheet: ModalSheet) -> some View {
        switch sheet {
        case .registration:
            RegistrationShieldView(isAuthenticated: $isAuthenticated)
                .environmentObject(coordinator)
        }
    }
}
