//
//  DayViewModel.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import Foundation

class DayViewModel: Identifiable, ObservableObject {
    private var dayTemp: Int
    private var nightTemp: Int
    private var date: String
    
    var dayCondition: Condition
    var nightCondition: Condition
    var id = UUID()
    
    lazy var formattedDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: date) else { return "Error formatting" }
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "E"
        let dayInWeek = dateFormatter.string(from: date)
        
        return dayInWeek
    }()
    
    lazy var day: String = {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(value: Double(dayTemp), unit: UnitTemperature.celsius)
        formatter.unitStyle = .long
        formatter.locale = Locale.current
        formatter.unitStyle = .medium
        return formatter.string(from: measurement)
    }()
    
    lazy var night: String = {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(value: Double(nightTemp), unit: UnitTemperature.celsius)
        formatter.unitStyle = .long
        formatter.locale = Locale.current
        formatter.unitStyle = .medium
        return formatter.string(from: measurement)
    }()
    
    init(date: String, dayTemp: Int, nightTemp: Int, dayCondition: String, nightCondition: String) {
        self.date = date
        self.dayTemp = dayTemp
        self.nightTemp = nightTemp
        self.dayCondition = Condition.castToCondition(iconName: dayCondition.camelized)
        self.nightCondition = Condition.castToCondition(iconName: nightCondition.camelized)
    }
}
