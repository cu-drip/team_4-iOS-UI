//
//  Admin.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 02.07.2025.
//

import Foundation

struct Admin: Identifiable, Hashable, Codable {
    var id = UUID()
    var phio: String?
    var phone: String
    var password: String
    var email: String?
}
