//
//  TournirMaker.swift
//  SportApp
//
//  Created by Zaitsev Vladislav on 04.07.2025.
//

import SwiftUI

struct TournirMaker: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var viewModel: TournirsViewModel
    
    @State var parametrs: [UserCodingKeys] = []
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var cost: String = ""
    @State private var selectedSport: Int = 0
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var selectedGender = 0
    let genders = ["Мужской", "Женский", "Любой"]
    @State private var minAge: Double = 0
    @State private var maxAge: Double = 100
    @State private var minWeight: Double = 0
    @State private var maxWeight: Double = 100
    @State private var minHeight: Double = 0
    @State private var maxHeight: Double = 100
    @State private var minMMR: Double = 500
    @State private var maxMMR: Double = 3000

    private var combinedDateTime: Date {
        let calendar = Calendar.current

        let dateComponents = calendar.component(.year, from: selectedDate)
        let month = calendar.component(.month, from: selectedDate)
        let day = calendar.component(.day, from: selectedDate)

        let hour = calendar.component(.hour, from: selectedTime)
        let minute = calendar.component(.minute, from: selectedTime)
        
        var components = DateComponents()
        components.year = dateComponents
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        
        return calendar.date(from: components) ?? Date()
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        coordinator.dismissSheet()
                    }, label: {
                        Text("EXIT")
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                    })
                    Text("Создание соревнования")
                        .font(.system(size: 21, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(16)
                    Text("EXIT")
                        .padding(.horizontal, 16)
                        .foregroundColor(.clear)
                }
                
                Text("Заполните информацию о")
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                Text("соревновании")
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 32)
                
                ScrollView {
                    CoolerField(placeholder: "Название события", text: $name)
                    
                    CoolerField(placeholder: "Описание события", text: $description)
                    
                    CoolerField(placeholder: "Стоимость участия", text: $cost)
                    
                    Picker("Спорт", selection: $selectedSport) {
                        ForEach(0..<Sport.allSports.count, id: \.self) { index in
                            Text(Sport.toString(Sport.allSports[index]))
                                .tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width: 200, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .tint(.black)
                    
                    Text("Выберите дату")
                        .font(.system(size: 20, weight: .medium))
                    DatePicker(
                        "Дата",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())

                    DatePicker(
                        "Время начала",
                        selection: $selectedTime,
                        displayedComponents: [.hourAndMinute]
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
                    
                    Text("расписание будет сгенерировано автоматически")
                        .foregroundColor(.blue)
                        .padding(.bottom, 16)

                    Divider()
                        .padding(.bottom, 16)
                    
                    Text("Критерии для участников")
                        .font(.system(size: 20, weight: .medium))
                        .padding(.bottom, 16)
                    
                    if parametrs.contains(.sexIsMan) {
                        HStack {
                            Text("Пол участников:")
                            Picker("Пол", selection: $selectedGender) {
                                ForEach(0..<genders.count, id: \.self) { index in
                                    Text(genders[index])
                                }
                            }
                        }
                    }
                    
                    if parametrs.contains(.age) {
                        RangeSliderView(name: "Возраст", lowerBound: $minAge, upperBound: $maxAge, range: 0...100)
                            .padding(.horizontal, 32)
                            .padding(.bottom, 16)
                    }

                    if parametrs.contains(.weight) {
                        RangeSliderView(name: "Вес", lowerBound: $minWeight, upperBound: $maxWeight, range: 0...100)
                            .padding(.horizontal, 32)
                            .padding(.bottom, 16)
                    }
                    
                    if parametrs.contains(.height) {
                        RangeSliderView(name: "Рост", lowerBound: $minHeight, upperBound: $maxHeight, range: 0...100)
                            .padding(.horizontal, 32)
                            .padding(.bottom, 16)
                    }
                    
                    if parametrs.contains(.mmr) {
                        RangeSliderView(name: "MMR", lowerBound: $minMMR, upperBound: $maxMMR, range: 500...3000)
                            .padding(.horizontal, 32)
                            .padding(.bottom, 16)
                    }
                    Spacer()
                        .frame(height: 100)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    let tourinr: Tournir = Tournir(id: UUID(), title: name, description: description, sport: Sport.toStringEng(Sport.allSports[selectedSport]), type_group: .olympic, type_tournir: .solo, start_time: combinedDateTime, created_at: Date(), entry_cost: Double(cost) ?? 0, is_team_based: true, place: "", max_participants: 10, organizer_id: UUID(), requirements: Requirements())
                    viewModel.tournirs.append(tourinr)
                    viewModel.giveTournir(tournir: tourinr)
                    coordinator.dismissSheet()
                }, label: {
                    Text("Создать")
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .cornerRadius(22)
                        .padding(16)
                        .foregroundColor(.white)
                })
            }
        }
        .onChange(of: selectedSport) {
            parametrs = Sport.allCases[Sport.allSports[selectedSport]] ?? []
        }
        .onAppear() {
            parametrs = Sport.allCases[Sport.allSports[selectedSport]] ?? []
        }
    }
}

struct CoolerField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 8)
    }
}

struct RangeSliderView: View {
    var name: String
    @Binding var lowerBound: Double
    @Binding var upperBound: Double
    let range: ClosedRange<Double>

    var body: some View {
        VStack {
            HStack {
                Text(name)
                
                Spacer()
                
                Text("\(Int(lowerBound))-\(Int(upperBound))")
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Фон
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(.gray)
                        .cornerRadius(5)

                    // Заполнение между ползунками
                    Rectangle()
                        .fill(Color.blue)
                        .frame(
                            width: CGFloat(upperPercentage(geometry.size.width)) - CGFloat(lowerPercentage(geometry.size.width)),
                            height: 4
                        )
                        .offset(x: CGFloat(lowerPercentage(geometry.size.width)), y: 0)

                    // Левый ползунок
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 21, height: 21)
                        .offset(x: CGFloat(lowerPercentage(geometry.size.width)) - 12, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newX = max(0, min(Double(gesture.location.x), upperBoundValue(geometry.size.width)))
                                    lowerBound = convertPositionToValue(newX, sizeWidth: geometry.size.width)
                                }
                        )

                    // Правый ползунок
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 21, height: 21)
                        .offset(x: CGFloat(upperPercentage(geometry.size.width)) - 12, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let newX = min(max(Double(gesture.location.x), lowerBoundValue(geometry.size.width)), Double(geometry.size.width))
                                    upperBound = convertPositionToValue(newX, sizeWidth: geometry.size.width)
                                }
                        )
                }
            }
            .padding(.horizontal, 10)
        }
    }

    // Переводим значение в проценты для позиционирования
    private func percentage(_ value: Double) -> Double {
        (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }

    private func lowerPercentage(_ width: CGFloat) -> Double {
        percentage(lowerBound) * Double(width)
    }

    private func upperPercentage(_ width: CGFloat) -> Double {
        percentage(upperBound) * Double(width)
    }

    private func convertPositionToValue(_ x: Double, sizeWidth: CGFloat) -> Double {
        let percent = x / Double(sizeWidth)
        return range.lowerBound + percent * (range.upperBound - range.lowerBound)
    }

    private func lowerBoundValue(_ width: CGFloat) -> Double {
        percentage(lowerBound) * Double(width)
    }

    private func upperBoundValue(_ width: CGFloat) -> Double {
        percentage(upperBound) * Double(width)
    }
}
