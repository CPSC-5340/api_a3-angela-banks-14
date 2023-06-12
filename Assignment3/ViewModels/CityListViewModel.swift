//
//  CityListViewModel.swift
//  Assignment3
//
//  Created by Angela Banks on 6/10/23.
//

import Foundation

class CityListViewModel: ObservableObject {
    @Published var cities: [City] = [
        City(name: "New York", latitude: 40.7128, longitude: -74.0060),
        City(name: "London", latitude: 51.5074, longitude: -0.1278),
        City(name: "Tokyo", latitude: 35.6895, longitude: 139.6917),
        City(name: "Dallas", latitude: 32.7767, longitude: 96.7970),
        City(name: "Los Angeles", latitude: 34.0522, longitude: 118.2437)
    ]
}
