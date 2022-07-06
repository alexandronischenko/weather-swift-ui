//
//  MainView.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 30.06.2022.
//

import SwiftUI

struct MainView: View {
    @State var showInfoModalView: Bool = false
    @StateObject private var viewModel: MainViewModel
    @ObservedObject var locationManager = LocationManager.shared
    
    private let timer = Timer.publish(every: 10, on: .main, in: .common)
        .autoconnect()
        .eraseToAnyPublisher()
    
    var body: some View {
        ZStack{
            ScrollView {
                VStack {
                    InfoView(viewModel: viewModel.info.first ?? InfoViewModel(city: "", degree: 0, condition: ""))
                        .foregroundColor(Color.white)
                        .padding()
                    
                    DayForecastView(items: viewModel.itemsByTheHour).foregroundColor(Color.white)
                        .padding()
                    
                    WeekForecastView(items: viewModel.itemsByTheDay).foregroundColor(Color.white)
                        .padding()
                }
            }
            .onAppear {
                if locationManager.userLocation == nil {
                    locationManager.requestLocation()
                }
                viewModel.fetchData()
            }
            .onReceive(timer, perform: { _ in
                viewModel.fetchData()
            })
            .background(
                LinearGradient(gradient: Gradient(
                    colors: [
                        Color.backgroundTop,
                        Color.backgroundBottom
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showInfoModalView = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    locationManager.requestLocation()
                    viewModel.fetchDataFromLocation()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .foregroundColor(Color.white)
                }
            }
        }
        .sheet(isPresented: $showInfoModalView) {
            SearchView(viewModel: SearchViewModel(), cityModel: viewModel)
        }
    }
}

extension MainView {
    init(with viewModel: MainViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(with:
                .init(city: City(
                    id: 0,
                    name: Localizable.moscow.localized,
                    coordinate: Coordinate(lat: 55.75, lon: 37.62))))
    }
}
