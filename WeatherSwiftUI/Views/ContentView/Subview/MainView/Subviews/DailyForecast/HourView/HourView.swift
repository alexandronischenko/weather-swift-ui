//
//  ItemByTheHour.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import SwiftUI

struct HourView: View {
    var item: HourViewModel
    
    var body: some View {
        VStack {
            Text("\(item.formattedTime)")
            Spacer()
            Image(systemName: "\(item.condition.rawValue)").padding(CGFloat(0.1))
            Spacer()
            Text("\(item.formattedTemp)")
        }
        .padding()
    }
}

struct ItemByTheHour_Previews: PreviewProvider {
    static var previews: some View {
        HourView(item: HourViewModel(id: 0, time: "12:00", temp: 23, condition: "https://yastatic.net/weather/i/icons/funky/dark/ovc_ts.svg"))
            .previewLayout(.sizeThatFits)
    }
}
