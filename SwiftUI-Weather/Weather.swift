//
//  Weather.swift
//  SwiftUI-Weather
//
//  Created by Todd James on 7/27/22.
//

import Foundation

struct Weather: Identifiable {
  
  var id = UUID()
  var dayOfWeek: String
  var type: WeatherType
  var temperature: Int
  
  enum WeatherType: String, CaseIterable {
    case cloudy
    case sunny
    case snow
    case windy
    case sunset
    
    var image: String {
      switch self {
        case .cloudy: return "cloud.sun.fill"
        case .sunny: return "sun.max.fill"
        case .snow: return "snow"
        case .windy: return "wind.snow"
        case .sunset: return "sunset.fill"
      }
    }
  }
}
