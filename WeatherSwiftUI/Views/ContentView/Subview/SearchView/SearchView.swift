//
//  SearchView.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 28.06.2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @Environment(\.presentationMode) private var presentationMode
    @State private var searchText = ""
    @StateObject var cityModel: MainViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                if searchResults.isEmpty {
                    Text(Localizable.nothingFound.localized)
                } else {
                    List(searchResults) { city in
                        Button {
                            cityModel.city = City(id: city.id, name: city.name, coordinate: city.coordinate)
                            cityModel.fetchData()
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text(city.name).modifier(Title2())
                        }
                    }
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                    .mint,
                    Color.backgroundTop,
                    Color.backgroundBottom
                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
                List(searchResults) { city in
                    Button(city.name) {
                        cityModel.city = City(id: city.id, name: city.name, coordinate: city.coordinate)
                        cityModel.fetchData()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    var searchResults: [City] {
        if searchText.isEmpty {
            return viewModel.cities
        } else {
            return viewModel.cities.filter { $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

extension SearchView {
    init(with viewModel: MainViewModel) {
        self._cityModel = StateObject(wrappedValue: viewModel)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(), cityModel: MainViewModel(city: City(id: 0, name: "", coordinate: Coordinate(lat: 0, lon: 0))))
    }
}
