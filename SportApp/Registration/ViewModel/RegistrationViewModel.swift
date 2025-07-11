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
    @Published var user: User?
    
    func register(user: User) {
        Task {
            do {
                let userDTO: UserDTO = try await GiveUserToDB(user: user)
                let newToken = try await getTocken(user: user)
                            
                await MainActor.run {
                    self.token = newToken
                    //print(self.token ?? "nil")
                }
                
                let jwt = try decode(jwt: newToken)
                guard let idUser = jwt["sub"].string else { return }
                //userDTO.id = idUser
                
                await MainActor.run {
                    var user1 = userDTO
                    user1.id = idUser
                    self.user = User(dto: user1)
                }
                
                //print(userDTO)
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
                    //print(self.token ?? "nil")
                    NetworkService.shared.token = token
                    UserDefaults.standard.set(newToken, forKey: "auth_token")
                    //JWTDecodeFunc(jwt: newToken)
                    //print(getTokenExpiration(newToken))
                    //print(getTokenID(newToken) ?? "aaa")
                }
                
                if let token = token {
                    loadUser(token)
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
    
    
    func loadUser(_ token: String) {
        Task {
            do {
                let jwt = try decode(jwt: token)
                guard let idUser = jwt["sub"].string else { return }
                
                let userEndpoint = UserEndpoint(userId: idUser)
                let userRequest = UserRequest()
                
                let userResponses: UserDTO = try await NetworkService.shared.request(
                    endpoint: userEndpoint,
                    requestDTO: userRequest
                )
                await MainActor.run {
                    user = User(dto: userResponses)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getTokenID(_ token: String) -> String? {
        do {
            let jwt = try decode(jwt: token)
            return jwt["sub"].string
        } catch {
            print("Ошибка декодирования токена: $error)")
            return nil
        }
    }
}


//1. ПОСТ: Закидывание пользователя в БД
//2. ПОСТ: возвращение токина по email и password
//3. ГЕТ: получение информации о пользователе по токину (пока не готово)
