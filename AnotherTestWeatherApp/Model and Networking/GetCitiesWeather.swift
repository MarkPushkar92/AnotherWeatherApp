//
//  GetCitiesWeather.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 13.07.2022.
//

import Foundation
import CoreLocation

let netWorkService = NetworkService()

func getCityWeather(citiesArray: [String], complitionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        getCoordinatesFrom(city: item) { coordinates, error in
            guard let coordinates = coordinates, error == nil else { return }
            netWorkService.fetchWeather(latitide: coordinates.latitude, longitude: coordinates.longitude) { weather in
                complitionHandler(index, weather)
            }
        }
    }
}

func getCoordinatesFrom(city: String, completion: @escaping(_ coordinates: CLLocationCoordinate2D?, _ error: Error?) ->()) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        completion(placemark?.first?.location?.coordinate, error)
    }
}
