//
//  ContentView.swift
//  Weather
//
//  Created by Subham Dhakal on 6/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight )
            
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 72)
                
                HStack(spacing: 20){
                    WeatherDayView(weather: Weather(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76))
                    WeatherDayView(weather: Weather(dayOfWeek: "WED", imageName: "cloud.fog.fill", temperature: 62))
                    WeatherDayView(weather: Weather(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 76))
                    WeatherDayView(weather: Weather(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 45))
                    WeatherDayView(weather: Weather(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 65))
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonText: "Change Day Time",textColor: .blue, backgroundColor: .white)
                }
            
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

class Weather {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    init(dayOfWeek: String, imageName: String, temperature: Int){
        self.dayOfWeek = dayOfWeek
        self.imageName = imageName
        self.temperature = temperature
    }
}

struct WeatherDayView: View {
    var weather : Weather

    var body: some View {
        VStack(spacing: 8){
            Text(weather.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: weather.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(weather.temperature)°")
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//        
        ContainerRelativeShape()
            .fill( isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

