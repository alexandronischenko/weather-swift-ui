//
//  InfoViewModel.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 24.06.2022.
//

import Foundation

final class InfoViewModel: ObservableObject {
    @Published var city: String
    @Published private var degree: Int
    @Published var condition: Condition
    
    lazy var temp: String = {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(value: Double(degree), unit: UnitTemperature.celsius)
        formatter.unitStyle = .long
        formatter.locale = Locale.current
        formatter.unitStyle = .medium
        return formatter.string(from: measurement)
    }()
    
    init(city: String, degree: Int, condition: String) {
        self.city = city.localizedUppercase
        self.degree = degree
        self.condition = Condition.castToCondition(iconName: condition.camelized)
    }
}
