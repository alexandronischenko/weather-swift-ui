//
//  HourViewModel.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import Foundation
import Combine
import UIKit
import SwiftSVG
import Alamofire

class HourViewModel: Identifiable, ObservableObject {
    var id: Int
    var time: String
    var condition: Condition
    
    private var temp: Int
    private var cancellable: AnyCancellable?
    
    lazy var formattedTime: String = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH"
        formatter.locale = .current
        guard let date = formatter.date(from: time) else { return "nil" }

        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }()
    
    lazy var formattedTemp: String = {
        let formatter = MeasurementFormatter()
        let measurement = Measurement(value: Double(temp), unit: UnitTemperature.celsius)
        formatter.unitStyle = .long
        formatter.locale = Locale.current
        formatter.unitStyle = .medium
        return formatter.string(from: measurement)
    }()
    
    init(id: Int, time: String, temp: Int, condition: String) {
        self.id = id
        self.time = time
        self.temp = temp
        self.condition = Condition.castToCondition(iconName: condition.camelized)
    }
}
