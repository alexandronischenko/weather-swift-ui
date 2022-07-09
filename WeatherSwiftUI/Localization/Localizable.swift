//
//  Localizable.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 30.06.2022.
//

import Foundation

enum Localizable: String {
    
    enum languageCode: String {
        case ru = "ru"
        case en = "en"
    }
    
    case search = "search"
    case hourlyForecast = "text_hourly_forecast"
    case weeklyForecast = "text_weekly_forecast"
    case moscow = "moscow"
    case kazan = "kazan"
    case saintPetersburg = "saint petersburg"
    case krasnodar = "krasnodar"
    case rostov = "rostov-on-don"
    case nothingFound = "nothing_found"
}

extension Localizable {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
