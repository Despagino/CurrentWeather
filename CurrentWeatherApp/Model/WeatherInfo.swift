//
//  WeatherInfo.swift
//  CurrentWeatherApp
//
//  Created by Ivan Ramirez on 2/3/22.
//

import Foundation


struct WeatherInfo: Codable {
    var coord: [Coord]
    var main: [Main]
    var weather: [Weather]
    var name: String
}

struct Weather: Codable {
    var main: String
    var description: String
    var id: Int
}

struct Coord: Codable {
    var lon: Double
    var lat: Double
}

struct Main: Codable {
    var temp: Double
    var tempMin: Double
    var tempMax: Double
}


