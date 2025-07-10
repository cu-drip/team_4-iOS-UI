//
//  RegistrationViewModel.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 08.07.2025.
//

import Foundation
import Combine
import JWTDecode

class RegistrationViewModel: ObservableObject {
    @Published var token: String?
    
    func register(user: User) {
        Task {
            do {
                let userDTO: UserDTO = try await GiveUserToDB(user: user)
                let newToken = try await getTocken(user: user)
                            
                await MainActor.run {
                    self.token = newToken
                    print(self.token ?? "nil")
                }
                print(userDTO)
            } catch {
                print(error)
            }
        }
    }
    
    func GiveUserToDB(user: User) async throws -> UserDTO {
        let registerEndpoint = RegisterEndpoint()
        let registerRequest = RegisterRequest(user: user)
        
        let registerResponses: UserDTO = try await NetworkService.shared.request(
            endpoint: registerEndpoint,
            requestDTO: registerRequest
        )
        
        return registerResponses
    }
    
    func getTocken(user: User) async throws -> String {
        //let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlNjZiODE2Yi0yNTM3LTQ2MDQtYmE0My02NWI3ZTFmNTJmMjIiLCJlbWFpbCI6Inl1MUBleGFtcGxlLmNvbSIsInJvbGVzIjpbIkFETUlOIl0sImlhdCI6MTc1MjA1Mzg3MiwiZXhwIjoxNzUyMTQwMjcyfQ.MspIFQmpivZe8C99sD1RYAZB7TpeIoIA4JYGizvtfy8"
        
        let loginEndpoint = LoginEndpoint()
        let loginRequest = LoginRequest(user: user)
        
        let loginResponses: TokenDTO = try await NetworkService.shared.request(
            endpoint: loginEndpoint,
            requestDTO: loginRequest
        )
        
        return loginResponses.token
    }
    
    func login(user: User) {
        Task {
            do {
                let newToken = try await getTocken(user: user)
                
                await MainActor.run {
                    self.token = newToken
                    print(self.token ?? "nil")
                    NetworkService.shared.token = token
                    UserDefaults.standard.set(newToken, forKey: "auth_token")
                    //JWTDecodeFunc(jwt: newToken)
                    print(getTokenExpiration(newToken))
                }
            } catch {
                print(error)
            }
        }
    }
    
    func JWTDecodeFunc(jwt: String) {
        do {
            let token = try decode(jwt: jwt)

            if let email = token["email"].string {
                print("Email: \(email)")
            }

            if let roles = token["roles"].string {
                print("Roles: \(roles)")
            }
            print(token)

//            if let expiresAt = token.expiredAt {
//                print("Expires at: \(expiresAt)")
//            }
//
//            // Если хочешь увидеть весь payload как Dictionary:
//            let allClaims = token.claims
//            print("All claims: \(allClaims)")
            
        } catch {
            print("❌ Failed to decode token: \(error)")
        }
    }
    
    func getTokenExpiration(_ token: String) -> Date? {
        do {
            let jwt = try decode(jwt: token)
            return jwt["exp"].date
        } catch {
            print("Ошибка декодирования токена: $error)")
            return nil
        }
    }
}


//1. ПОСТ: Закидывание пользователя в БД
//2. ПОСТ: возвращение токина по email и password
//3. ГЕТ: получение информации о пользователе по токину (пока не готово)
