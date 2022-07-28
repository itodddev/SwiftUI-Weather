//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Todd James on 7/27/22.
//

import SwiftUI

struct ContentView: View {
  
  private let days: [Weather] = [Weather(dayOfWeek: "TUE", type: .cloudy, temperature: 74),
                             Weather(dayOfWeek: "WED", type: .sunny, temperature: 88),
                             Weather(dayOfWeek: "THU", type: .windy, temperature: 50),
                             Weather(dayOfWeek: "FRI", type: .sunset, temperature: 60),
                             Weather(dayOfWeek: "SAT", type: .snow, temperature: 25)
                            ]
  
  @State private var isNight = false

  var body: some View {
    ZStack {
      
      BackgroundView(isNight: isNight)
      
      VStack {
        CityTextView(cityName: "Cupertino, CA")
          
        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                              temperature: 76)
        
        HStack(spacing: 20) {
          
          ForEach(days) { day in
            WeatherDayView(dayOfWeek: day.dayOfWeek, imageName: day.type.image, temperature: day.temperature)
          }
        }
    
        Spacer()
        
        Button(action: {
            isNight.toggle()
        }, label: {
          WeatherButton(title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
        })
        
        Spacer()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {
  
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 6){
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
      
      Image(systemName: imageName)
        .symbolRenderingMode(.multicolor)
        .resizable()
        .scaledToFit()
        .frame(width: 40, height: 49)
      
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {

  var isNight: Bool
  
  var body: some View {
    LinearGradient(
      gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
      .ignoresSafeArea(.all)
  }
}

struct CityTextView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: imageName)
        .symbolRenderingMode(.multicolor)
        .resizable()
        .scaledToFit()
        .frame(width: 180, height: 180)
      
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}
