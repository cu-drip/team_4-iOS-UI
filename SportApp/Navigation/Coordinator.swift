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
    @Published var statListPath = NavigationPath()
    @Published var presentedSheet: ModalSheet?
    @Published var user: User = User(id: UUID(), phio: "", password: "", email: "", isAdmin: false)
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
        giveTournir()
    }
    
    func updateUser() {
        Task {
            let userEndpoint = UserPatchEndpoint(userId: user.id.uuidString)
            let userRequest = UserDTO(user: user)
            //userRequest.age = 123456789
            
            //print(user.id.uuidString)
            //print(userRequest)
            
            do {
                let _: UserDTO = try await NetworkService.shared.request(
                    endpoint: userEndpoint,
                    requestDTO: userRequest
                )
                //print(respone)
            } catch {
                print(error)
            }
        }
    }
    
    func giveTournir(userID: String? = nil, tournirID: String? = nil) {
        Task {
            let tournirID: String = tournirID ?? (currentTournir!.id.uuidString)
            let userID: String = userID ?? (user.id.uuidString)
            let postPartisipantEndpoint = PostPartisipantEndpoint(userId: userID, tournirId: tournirID)
            let postPartisipantRequest = PostPartisipantRequest()
            print(postPartisipantEndpoint.path)
            do {
                let respone: String = try await NetworkService.shared.request(
                    endpoint: postPartisipantEndpoint,
                    requestDTO: postPartisipantRequest
                )
                print(respone)
            } catch {
                print(error)
            }
        }
    }
}
