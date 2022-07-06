//
//  InfoView.swift
//  WeatherSwiftUI
//
//  Created by Alexandr Onischenko on 01.07.2022.
//

import SwiftUI

struct InfoView: View {
    var viewModel: InfoViewModel
    
    var body: some View {
        VStack {
            Text("\(viewModel.city)")
                .modifier(TitleCity())
                
            Text("\(viewModel.temp)")
                .modifier(TitleTemp())
            
            Spacer()
            
            Image(systemName: "\(viewModel.condition.rawValue)")
                .imageScale(.large)
                .padding(.bottom, 20)
        }.foregroundColor(Color.white)
    }
}

//extension InfoView {
//    init(with viewModel: InfoViewModel) {
//        self._viewModel = StateObject(wrappedValue: viewModel)
//    }
//}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel: InfoViewModel(city: "", degree: 0, condition: ""))
    }
}
