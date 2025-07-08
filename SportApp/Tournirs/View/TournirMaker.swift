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
    @State private var selectedSport: Int = 0
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var minAge: Double = 0
    @State private var maxAge: Double = 100
    @State private var cost: Double = 0

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
                            .padding(16)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                }
                
                ScrollView {
                    CoolerField(placeholder: "Название события", text: $name)
                    
                    CoolerField(placeholder: "Описание события", text: $description)
                    
                    Picker("Пол", selection: $selectedSport) {
                        ForEach(0..<Sport.allSports.count, id: \.self) { index in
                            Text(Sport.toString(Sport.allSports[index]))
                                .tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                            .background(
                                Color(.secondarySystemBackground)
                                    .cornerRadius(12)
                            )
                    )
                    .padding(.horizontal, 20)
                    
                    Slider(value: $cost, in: 0...100000) {
                        Text("\(Int(cost))")
                    }
                    
                    Text("Выберите дату:")
                    DatePicker(
                        "Дата",
                        selection: $selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())

                    Text("Выберите время:")
                    DatePicker(
                        "Время",
                        selection: $selectedTime,
                        displayedComponents: [.hourAndMinute]
                    )

                    Divider()
                    
                    Text("Параметры для людей")
                    
                    if parametrs.contains(.age) {
                        RangeSliderView(name: "Возраст", lowerBound: $minAge, upperBound: $maxAge, range: 0...100)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    let tourinr: Tournir = Tournir(title: name, description: description, sport: Sport.toStringEng(Sport.allSports[selectedSport]), type_group: .olympic, type_tournir: .solo, start_time: combinedDateTime, created_at: Date(), entry_cost: cost, is_team_based: true, place: "", max_participants: 10, organizer_id: UUID(), requirements: Requirements())
                    viewModel.tournirs.append(tourinr)
                    viewModel.giveTournir(tournir: tourinr)
                    coordinator.dismissSheet()
                }, label: {
                    Text("COZDATb")
                        .padding(16)
                        .foregroundColor(.black)
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
                        .frame(height: 10)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .cornerRadius(5)

                    // Заполнение между ползунками
                    Rectangle()
                        .fill(Color.blue)
                        .frame(
                            width: CGFloat(upperPercentage(geometry.size.width)) - CGFloat(lowerPercentage(geometry.size.width)),
                            height: 10
                        )
                        .offset(x: CGFloat(lowerPercentage(geometry.size.width)), y: 0)

                    // Левый ползунок
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 24, height: 24)
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
                        .frame(width: 24, height: 24)
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
