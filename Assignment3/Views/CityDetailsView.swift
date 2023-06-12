//
//  CityDetailsView.swift
//  Assignment3
//
//  Created by Angela Banks on 6/10/23.
//

import SwiftUI

struct CityDetailsView: View {
    @ObservedObject var viewModel: CityDetailsViewModel

    var body: some View {
        VStack {
            Text(viewModel.city.name)
                .font(.title)
                .padding()

            if let weatherInfo = viewModel.weatherInfo {
                Text("Temperature: \(weatherInfo.temperature)")
                Text("Humidity: \(weatherInfo.humidity)")
                Text("Wind Speed: \(weatherInfo.windSpeed)")
            } else {
                Text("Fetching weather information...")
            }
        }
        .navigationBarTitle("City Details")
        .task {
            await viewModel.fetchWeatherInfo()
        }
    }
}

//struct CityDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityDetailsView(viewModel: CityDetailsViewModel(city: City(name: <#T##String#>, latitude: <#T##Double#>, longitude: <#T##Double#>)))
//    }
//}
