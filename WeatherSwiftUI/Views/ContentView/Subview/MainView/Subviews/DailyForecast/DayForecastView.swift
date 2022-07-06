//
//  ListByTheHour.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import SwiftUI

struct DayForecastView: View {
    
    var items: [HourViewModel]
    
    var body: some View {
        ZStack {
            Color.backgroundView
            VStack {
                HStack {
                    Text(Localizable.hourlyForecast.localized)
                        .padding()
                        .modifier(Title1())
                    Spacer()
                }
                Divider()
                ScrollView(.horizontal, content: {
                    HStack {
                        ForEach(items, id: \.id) { item in
                            HourView(item: item)
                        }
                    }
                })
            }
        }.cornerRadius(8)
    }
}

struct ListByTheHour_Previews: PreviewProvider {
    static var previews: some View {
        DayForecastView(items: [])
            .previewLayout(.sizeThatFits)
    }
}
