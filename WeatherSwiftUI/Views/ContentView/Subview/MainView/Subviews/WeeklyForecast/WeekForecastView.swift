//
//  ListByTheDay.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import SwiftUI

struct WeekForecastView: View {
    var items: [DayViewModel]
    
    var body: some View {
        ZStack {
            Color.backgroundView
            VStack {
                HStack {
                    Text(Localizable.weeklyForecast.localized)
                        .padding()
                        .modifier(Title1())
                    Spacer()
                }
                VStack {
                    ForEach(items, id: \.id) { item in
                        Divider()
                        DayView(item: item)
                    }
                }
            }
        }.cornerRadius(12)
    }
}

struct ListByTheDay_Previews: PreviewProvider {
    static var previews: some View {
        WeekForecastView(items: [DayViewModel(date: "11.01.2022", dayTemp: 15, nightTemp: 20, dayCondition: "clear", nightCondition: "clear")])
        .previewLayout(.sizeThatFits)
    }
}
