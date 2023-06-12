//
//  WeatherDataModel.swift
//  Assignment3
//
//  Created by Angela Banks on 6/10/23.
//

import Foundation

struct ForecastResponse: Codable {
    let list: [WeatherData]
}

struct WeatherData: Codable {
    let main: MainData
    let wind: WindData
}

struct MainData: Codable {
    let temp: Double
    let humidity: Double
}

struct WindData: Codable {
    let speed: Double
}
