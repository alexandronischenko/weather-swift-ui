//
//  ItemByTheDay.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 22.06.2022.
//

import SwiftUI

struct DayView: View {
    var item: DayViewModel
        
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            Text(item.formattedDate)
                .multilineTextAlignment(.leading)
                .frame(width: 80, alignment: .leading)
                .modifier(Title2())
                .padding(.bottom, 8)
            Spacer()

            Group {
                Image(systemName: "\(item.dayCondition.rawValue)").padding(CGFloat(0.1))
                Image(systemName: "\(item.nightCondition.rawValue)").padding(CGFloat(0.1))
            }

            Spacer(minLength: nil)

            Text("\(item.night) / \(item.day)").multilineTextAlignment(.trailing)
        }
//        LazyHGrid(rows: columns, alignment: .center, spacing: 20) {
//            Text(item.formattedDate).multilineTextAlignment(.leading)
//            Spacer(minLength: 20)
//
//            Image(systemName: "\(item.dayCondition.rawValue)").padding(CGFloat(0.1))
//            Image(systemName: "\(item.nightCondition.rawValue)").padding(CGFloat(0.1))
//
//            Spacer(minLength: 50)
//
//            Text("\(item.night) / \(item.day)")
//        }
        
        .padding()
        .listRowBackground(Color.cyan)
    }
}

struct ItemByTheDay_Previews: PreviewProvider {
    static var previews: some View {
        DayView(item: DayViewModel(date: "11.2022", dayTemp: 20, nightTemp: 10, dayCondition: "clear", nightCondition: "clear"))
            .previewLayout(.sizeThatFits)
    }
}
