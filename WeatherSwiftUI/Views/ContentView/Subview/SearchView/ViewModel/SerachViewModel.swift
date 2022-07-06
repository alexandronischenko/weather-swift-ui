//
//  SerachViewModel.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 28.06.2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var cities = Constants.shared.cities
}
