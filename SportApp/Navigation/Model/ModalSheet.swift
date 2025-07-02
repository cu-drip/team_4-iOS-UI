//
//  ModalSheet.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

enum ModalSheet: Identifiable {
    case registration
    
    var id: Int {
        switch self {
        case .registration:
            return 0
        }
    }
}
