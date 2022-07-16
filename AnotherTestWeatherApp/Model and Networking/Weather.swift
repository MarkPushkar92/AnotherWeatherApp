//
//  Weather.swift
//  AnotherTestWeatherApp
//
//  Created by Марк Пушкарь on 12.07.2022.
//

import Foundation

struct Weather {
    
    var name: String = "Загрузка"
    var temp: Int = 0
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var pressureMm: Int = 0
    var windSpeed: Double = 0
    var tempMin: Int = 0
    var tempMax: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear" : return "ясно"
        case "partly-cloudy" : return "малооблачно"
        case "cloudy" : return "облачно с прояснениями"
        case "overcast" : return "пасмурно"
        case "drizzle" : return "морось"
        case "light-rain" : return "небольшой дождь"
        case "rain" : return "дождь"
        case "moderate-rain" : return "меренно сильный дождь"
        case "heavy-rain" : return "сильный дождь"
        case "continuous-heavy-rain" : return "длительный сильный дождь"
        case "showers" : return "ливень"
        case "wet-snow" : return "дождь со снегом."
        case "light-snow" : return "небольшой снег"
        case "snow" : return "снег"
        case "snow-showers" : return "снегопад"
        case "hail" : return "град"
        case "thunderstorm" : return "гроза"
        case "thunderstorm-with-rain" : return "дождь с грозой"
        case "thunderstorm-with-hail" : return "гроза с градом"
            
        default: return "..."
        }
    }
    
    init?(weatherData: WeatherData) {
        temp = weatherData.fact.temp
        conditionCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        pressureMm = weatherData.fact.pressureMm
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
        
    }
    
    init() {
        
    }
}


