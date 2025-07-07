//
//  TournirRegistration.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 03.07.2025.
//

import SwiftUI

struct TournirRegistration: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: TournirsViewModel
    @State var parametrs: [UserCodingKeys] = []
    
    @State var email: String = ""
    @State var age: String = ""
    @State private var selectedGender = 0
    let genders = ["Мужской", "Женский"]
    @State var weight: String = ""
    @State var height: String = ""
    @State var mmr: String = ""
    @State var bio: String = ""

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.presentedSheet = nil
                }, label: {
                    Text("EXIT")
                        .padding(16)
                        .foregroundColor(.black)
                })
                
                Spacer()
            }
            
            VStack {
                Text(coordinator.currentTournir!.sport)
                
                Form {
                    if parametrs.contains(.email) {
                        TextField("Email", text: $email)
                            .padding()
                    }
                    
                    if parametrs.contains(.age) {
                        TextField("Age", text: $age)
                            .padding()
                    }
                    
                    if parametrs.contains(.sexIsMan) {
                        Picker("Пол", selection: $selectedGender) {
                            ForEach(0..<genders.count, id: \.self) { index in
                                Text(genders[index])
                            }
                        }
                    }
                    
                    if parametrs.contains(.weight) {
                        TextField("Weight", text: $weight)
                            .padding()
                    }
                    
                    if parametrs.contains(.height) {
                        TextField("Height", text: $height)
                            .padding()
                    }
                    
                    if parametrs.contains(.mmr) {
                        TextField("Mmr", text: $mmr)
                            .padding()
                    }
                    
                    if parametrs.contains(.bio) {
                        TextField("Bios", text: $bio)
                            .padding()
                    }
                }
                
                Button(action: {
                    if coordinator.currentTournir == nil{
                        return
                    }
                    escape()
                    if let index = viewModel.tournirs.firstIndex(of: coordinator.currentTournir!) {
                        viewModel.tournirs.remove(at: index)
                        coordinator.registratateUser()
                        viewModel.tournirs.insert(coordinator.currentTournir!, at: index)
                    } else {
                        coordinator.registratateUser()
                    }
                    coordinator.presentedSheet = nil
                }, label: {
                    Text("Зарегестрироваться")
                        .padding()
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            parametrs = Sport.allCases[Sport.fromString(coordinator.currentTournir!.sport)] ?? []
            
            if parametrs.contains(.email) {
                email = coordinator.user.email
            }
            
            if parametrs.contains(.age) && coordinator.user.age != nil {
                age = String(coordinator.user.age!)
            }
            
            if parametrs.contains(.sexIsMan) && coordinator.user.sexIsMan != nil {
                selectedGender = coordinator.user.sexIsMan! ? 0 : 1
            }
            
            if parametrs.contains(.weight) && coordinator.user.weight != nil {
                weight = String(coordinator.user.weight!)
            }
            
            if parametrs.contains(.height) && coordinator.user.height != nil {
                height = String(coordinator.user.height!)
            }
            
            if parametrs.contains(.mmr) && coordinator.user.mmr != nil {
                mmr = String(coordinator.user.mmr!)
            }
            
            if parametrs.contains(.bio) {
                bio = coordinator.user.bio ?? ""
            }
        }
    }
    
    func escape() {
        if email != "" {
            coordinator.user.email = email
        }
        if age != "" && Int(age) != nil {
            coordinator.user.age = Int(age)
        }
        if parametrs.contains(.sexIsMan) {
            coordinator.user.sexIsMan = selectedGender == 0
        }
        if weight != "" && Double(weight) != nil {
            coordinator.user.weight = Double(weight)
        }
        if height != "" && Double(height) != nil {
            coordinator.user.height = Double(height)
        }
        if mmr != "" && Int(mmr) != nil {
            coordinator.user.mmr = Double(mmr)
        }
        if bio != "" {
            coordinator.user.bio = bio
        }
    }
}
