//
//  Coordinator.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI
import Combine

class Coordinator: ObservableObject {
    @Published var tournirListPath = NavigationPath()
    @Published var presentedSheet: ModalSheet?
    @Published var whoAreYou: Appointment?
    @Published var user: User?
    @Published var admin: Admin?
    @Published var currentSport: Sport?
    @Published var currentTournir: Tournir?
    
    func presentSheet(_ sheet: ModalSheet) {
        presentedSheet = sheet
    }
    
    func dismissSheet() {
        presentedSheet = nil
        currentSport = nil
        currentTournir = nil
    }
    
    func registratateUser() {
        if let user = user {
            if currentTournir?.users.contains(where: { $0.id == user.id }) ?? true {
                return
            }
            currentTournir?.users.append(user)
            if currentTournir != nil{
                print(currentTournir!.users)
            }
        }
    }
}
