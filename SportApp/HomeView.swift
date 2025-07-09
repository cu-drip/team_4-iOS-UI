//
//  HomeView.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var coordinator = Coordinator()
    @StateObject var viewModelOfTournirs = TournirsViewModel()
    @StateObject var viewModelOfRegistration = RegistrationViewModel()
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
            NavigationStack(path: $coordinator.tournirListPath) {
                TournirsListView()
                    .environmentObject(coordinator)
                    .environmentObject(viewModelOfTournirs)
                    .navigationDestination(for: Tournir.self) { detail in
                        TournirsDetail()
                            .environmentObject(coordinator)
                    }
            }
            .tabItem {
                Label("Главная", systemImage: "house.fill")
            }
            .tag(0) // исправить потом

            NavigationStack() {
                ProfileView()
                    .environmentObject(coordinator)
            }
            .tabItem {
                Label("Профиль", systemImage: "person.crop.circle")
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
                .environmentObject(viewModelOfRegistration)
        case .registrationToTournir:
            TournirRegistration()
                .environmentObject(coordinator)
                .environmentObject(viewModelOfTournirs)
        case .tounirMaker:
            TournirMaker()
                .environmentObject(coordinator)
                .environmentObject(viewModelOfTournirs)
        }
    }
}
