//
//  KeyChainManager.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 11.07.2025.
//

import KeychainAccess

class KeyСhainManager {
    static let shared = KeyСhainManager()
    
    private let keychain: Keychain
    
    private init() {
        self.keychain = Keychain(service: "com.yourapp.sportapp")
    }

    func saveToken(_ number: String) {
        do {
            try keychain.set(number, key: "token")
        } catch {
            print(error)
        }
    }

    func getToken() -> String? {
        return keychain["token"]
    }

    func deleteToken() {
        do {
            try keychain.remove("token")
        } catch {
            print("error")
        }
    }
}
