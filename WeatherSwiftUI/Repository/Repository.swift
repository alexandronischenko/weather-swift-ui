//
//  Repository.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import Foundation
import Alamofire
import Combine

class WeatherRepository {
    static var shared = WeatherRepository()
    
    private var header: HTTPHeaders = ["X-Yandex-API-Key": "264381ce-e661-4a40-baea-5d1987bf9506"]
    
    private var path = "https://api.weather.yandex.ru/v2/forecast"
    
    private init() {}
    
    enum ErrorResponse: Error {
        case failedToGetData
    }
    
    func getForecast(in city: City, completion: @escaping ((Result<Weather, Error>) -> ())) {
        let loc = Locale.current.languageCode
        let lang = loc == "ru" ? "ru_RU" : "en_US"

        AF.request("\(path)?lat=\(city.coordinate.lat)&lon=\(city.coordinate.lon)&lang=\(lang)", headers: header).response { response in
            guard let data = response.data else {
                print("Failed to get")
                completion(.failure(ErrorResponse.failedToGetData))
                return
            }
            let decoder = JSONDecoder()
            guard let weather = try? decoder.decode(Weather.self, from: data) else {
                print("Failed to decode")
                completion(.failure(ErrorResponse.failedToGetData))
                return
            }
            completion(.success(weather))
        }
    }
    
    func getForecast(completion: @escaping ((Result<Weather, Error>) -> ())) {
        guard let lat = LocationManager.shared.userLocation?.coordinate.latitude,
              let lon = LocationManager.shared.userLocation?.coordinate.longitude else { return }
        
        let loc = Locale.current.languageCode
        let lang = loc == "ru" ? "ru_RU" : "en_US"
        
        AF.request("\(path)?lat=\(lat)&lon=\(lon)&lang=\(lang)", headers: header).response { response in
            guard let data = response.data else {
                print("Failed to get")
                completion(.failure(ErrorResponse.failedToGetData))
                return
            }
            let decoder = JSONDecoder()
            guard let weather = try? decoder.decode(Weather.self, from: data) else {
                print("Failed to decode")
                completion(.failure(ErrorResponse.failedToGetData))
                return
            }
            completion(.success(weather))
        }
    }
    
    func getForecast() -> AnyPublisher<Weather, Never> {
        guard let lat = LocationManager.shared.userLocation?.coordinate.latitude,
              let lon = LocationManager.shared.userLocation?.coordinate.longitude else {
            return Just(Weather()).eraseToAnyPublisher()
        }
        
        let loc = Locale.current.languageCode
        let lang = loc == "ru" ? "ru_RU" : "en_US"
        
        let decoder = JSONDecoder()
        
        guard let url = URL(string: "\(path)?lat=\(lat)&lon=\(lon)&lang=\(lang)") else {
            return Just(Weather()).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: Weather.self,
                    decoder: decoder)
            .replaceError(with: Weather())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
