//
//  Coordinator.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import SwiftUI
import Combine

class Coordinator: ObservableObject {
    @Published var presentedSheet: ModalSheet?
    @Published var whoAreYou: Appointment?
    
    func presentSheet(_ sheet: ModalSheet) {
        presentedSheet = sheet
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
}
