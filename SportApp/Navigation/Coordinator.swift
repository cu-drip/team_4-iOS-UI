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
    @Published var user: User = User(phio: "", phone: "", password: "", isAdmin: false)
    @Published var currentTournir: Tournir?
    
    func presentSheet(_ sheet: ModalSheet) {
        presentedSheet = sheet
    }
    
    func dismissSheet() {
        presentedSheet = nil
        currentTournir = nil
    }
    
    func registratateUser() {
            if currentTournir?.users.contains(where: { $0.id == user.id }) ?? true {
                return
            }
            currentTournir?.users.append(user)
            if currentTournir != nil{
                print(currentTournir!.users)
            }
        }
    }
