//
//  WeatherController.swift
//  CurrentWeatherApp
//
//  Created by Ivan Ramirez on 2/3/22.
//

import Foundation
import CoreLocation


struct WeatherController {

    //Our Goal
    //https://api.openweathermap.org/data/2.5/weather?lat=40.524670&lon=-111.863823&appid=a715b4215a6ddc28e9eb0d95ea296611&units=imperial

    private let apiKey = "a715b4215a6ddc28e9eb0d95ea296611"
    private let baseURL = "https://api.openweathermap.org"

    //MARK: - Fetch Function
    
    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<WeatherInfo, NetworkingError>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(.badBaseURL))
            return
        }

        url.appendingPathComponent("data")
        url.appendingPathComponent("2.5")
        url.appendingPathComponent("weather")
        
        var component = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        //adding all queries to our URL
        let latQuery = URLQueryItem(name: "lat", value: lat)
        let lonQuery = URLQueryItem(name: "lat", value: lon)
        let appIDQuery = URLQueryItem(name: "appid", value: apiKey)
        let unitsQuery = URLQueryItem(name: "units", value: "imperial")
        
        //appending queries to the compoenent
        component?.queryItems = [latQuery, lonQuery, appIDQuery, unitsQuery]
        
        guard let finalURL = component?.url else {
            completion(.failure(.badBuiltURL))
            return
        }
        
        // URLSession
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(.errorWithRequest))
                return
            }
            
            //response
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            //data
            
            guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
            
            do {
                let weatherObject = try JSONDecoder().decode(WeatherInfo.self, from: data)
                completion(.success(weatherObject))
            } catch let error {
                print(error)
                completion(.failure(.errorWithRequest))
            }
        }.resume()
    }
}
