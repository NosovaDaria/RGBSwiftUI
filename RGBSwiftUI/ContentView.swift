//
//  ContentView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var redSliderValue = 178.0
  @State private var greenSliderValue = 120.0
  @State private var blueSliderValue = 74.0
  @State private var alertPresented  = false
  
  
    
    var body: some View {
      VStack {
        ColorView(color: .init(red: redSliderValue / 255, green: greenSliderValue / 255, blue: blueSliderValue / 255, opacity: 1.0))
        ColorSlidersView(
          sliderValue: $redSliderValue,
          alertPresent: $alertPresented,
          textFieldValue: String(lround(redSliderValue)),
          color: .red
        )
        ColorSlidersView(
          sliderValue: $greenSliderValue,
          alertPresent: $alertPresented,
          textFieldValue: String(lround(greenSliderValue)),
          color: .green
        )
        ColorSlidersView(
          sliderValue: $blueSliderValue,
          alertPresent: $alertPresented,
          textFieldValue: String(lround(blueSliderValue)),
          color: .blue
        )
    
        Spacer()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlidersView: View {
  @Binding var sliderValue: Double
  @Binding var alertPresent: Bool
  @State var textFieldValue: String
  let color: Color
  
  var body: some View {
    HStack {
      Text("\(lround(sliderValue))")
        .frame(width: 40)
      
      Slider(value: $sliderValue, in: 0...255, step: 1)
        .accentColor(color).frame(width: 240, height: 2)
        .onChange(of: sliderValue) { newValue in
          textFieldValue = String(lround(newValue))
        }
      
      TextField("", text: $textFieldValue)
        .onChange(of: textFieldValue, perform: { newValue in
          if var newValue = Double("0\(newValue)") {
            if (newValue > 255) {
              newValue = 255
            }
            sliderValue = Double(newValue)
          } else {
            alertPresent.toggle()
          }
          textFieldValue = "\(Int(sliderValue))"
        })
        .keyboardType(.numberPad)
        .textFieldStyle(.roundedBorder)
    }
    .padding(.horizontal)
  }
}
