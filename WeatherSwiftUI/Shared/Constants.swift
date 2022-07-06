//
//  Constants.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 27.06.2022.
//

import Foundation

class Constants {
    static let shared = Constants()
    
    private init() {}
    
    let cities = [
        City(id: 0,
             name: Localizable.moscow.localized,
             coordinate: Coordinate(lat: 55.75, lon: 37.62)),
        City(id: 1,
             name: Localizable.kazan.localized,
             coordinate: Coordinate(lat: 55.79, lon: 49.12)),
        City(id: 2,
             name: Localizable.saintPetersburg.localized,
             coordinate: Coordinate(lat: 59.94, lon: 30.31)),
        City(id: 3,
             name: Localizable.krasnodar.localized,
             coordinate: Coordinate(lat: 45.04, lon: 38.98)),
        City(id: 4,
             name: Localizable.rostov.localized,
             coordinate: Coordinate(lat: 47.23, lon: 39.72)),
    ]
}
