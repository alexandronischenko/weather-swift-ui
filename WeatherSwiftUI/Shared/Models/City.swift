//
//  City.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 30.06.2022.
//

import Foundation

struct City: Identifiable {
    let id: Int
    let name: String
    let coordinate: Coordinate
    
    static func == (lhs: City, rhs: City) -> Bool {
        lhs.name == rhs.name
    }
}
