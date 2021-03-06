//
//  NetworkingError.swift
//  CurrentWeatherApp
//
//  Created by Ivan Ramirez on 2/3/22.
//

import Foundation

enum NetworkingError: String, Error {

    case badBaseURL = "Ensure the URL is valid"
    case invalidData = "Unable to read data. Please try again"
    case badBuiltURL = "The built URL is bad. Ensure the URL is built correctly"
    case invalidResponse = "Error with the serve. Ensure the user name is correct and please try again"
    case errorWithRequest = "Error with your request. Please try again"
}
