//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView(with: MainViewModel(city: City(
                id: 0,
                name: Localizable.moscow.localized,
                coordinate: Coordinate(lat: 55.75, lon: 37.62))))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
