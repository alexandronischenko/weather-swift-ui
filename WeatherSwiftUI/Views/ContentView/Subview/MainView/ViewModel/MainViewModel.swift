//
//  ContentViewModel.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 24.06.2022.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
    @Published var city: City
    @Published var itemsByTheDay: [DayViewModel] = []
    @Published var itemsByTheHour: [HourViewModel] = []
    @Published var info: [InfoViewModel] = []
    
    private var anyCancelable: Set<AnyCancellable> = []
    
    public init(info: [InfoViewModel],
                days: [DayViewModel],
                hours: [HourViewModel]) {
        self.itemsByTheDay = days
        self.itemsByTheHour = hours
        self.info = info
        self.city = City(
            id: 0,
            name: Localizable.moscow.localized,
            coordinate: Coordinate(lat: 55.75, lon: 37.62))
    }
    
    public init(city: City) {
        self.city = city
    }
    
    func fetchData() {
        WeatherRepository.shared.getForecast(in: self.city) { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let weather):
                self.clearData()
                self.setData(weather: weather)
            }
        }
    }
    
    func fetchDataFromLocation() {
        WeatherRepository.shared.getForecast { result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let weather):
                self.clearData()
                self.setData(weather: weather)
            }
        }
    }
    
    func setData(weather: Weather) {
        let info = InfoViewModel(city: weather.geoObject.locality.name,
                                 degree: weather.fact.temp,
                                 condition: weather.fact.condition)
        self.info.append(info)
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        for i in hour..<weather.forecasts[0].hours.count {
            let model = HourViewModel(time: weather.forecasts[0].hours[i].hour,
                                      temp: weather.forecasts[0].hours[i].temp,
                                      condition: weather.forecasts[0].hours[i].condition)
            self.itemsByTheHour.append(model)
        }
        
        for i in 0..<hour {
            let model = HourViewModel(time: weather.forecasts[1].hours[i].hour,
                                      temp: weather.forecasts[1].hours[i].temp,
                                      condition: weather.forecasts[1].hours[i].condition)
            self.itemsByTheHour.append(model)
        }
        
        for i in 0..<7 {
            let model = DayViewModel(
                date: weather.forecasts[i].date,
                dayTemp:  weather.forecasts[i].parts.day.temp,
                nightTemp: weather.forecasts[i].parts.night.temp,
                dayCondition: weather.forecasts[i].parts.day.condition,
                nightCondition: weather.forecasts[i].parts.night.condition)
            self.itemsByTheDay.append(model)
        }
    }
    
    func clearData() {
        info = []
        itemsByTheDay = []
        itemsByTheHour = []
    }
}
