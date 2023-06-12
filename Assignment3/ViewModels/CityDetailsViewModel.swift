//
//  CityDetailsViewModel.swift
//  Assignment3
//
//  Created by Angela Banks on 6/10/23.
//

import Foundation

class CityDetailsViewModel: ObservableObject {
    @Published var city: City
    @Published var weatherInfo: WeatherInfo?

    private let apiKey = "b0ca961cf8f82e156b6756eab589900e"

    init(city: City) {
        self.city = city
    }

    func fetchWeatherInfo() {
        Task {
            do {
                guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(city.latitude)&lon=\(city.longitude)&appid=\(apiKey)") else {
                    print("Invalid URL")
                    return
                }

                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let forecast = try decoder.decode(ForecastResponse.self, from: data)
                if let currentWeather = forecast.list.first {
                    let weatherInfo = WeatherInfo(
                        temperature: currentWeather.main.temp,
                        humidity: currentWeather.main.humidity,
                        windSpeed: currentWeather.wind.speed
                        // Add more properties as needed
                    )
                    DispatchQueue.main.async {
                        self.weatherInfo = weatherInfo
                    }
                }
            } catch {
                print("Failed to fetch or decode weather information: \(error)")
            }
        }
    }
}
