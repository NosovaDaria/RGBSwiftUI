//
//  ContentView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
  @State private var red = 174.0
  @State private var green = 120.0
  @State private var blue = 74.0
  
  @FocusState private var focusedField: Bool
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(#colorLiteral(red: 0, green: 0.3765624762, blue: 0.7304599881, alpha: 1)).ignoresSafeArea()
        VStack(spacing: 40) {
          ColorView(red: red, green: green, blue: blue)
          
          VStack {
            SliderView(sliderValue: $red, color: .red)
            SliderView(sliderValue: $green, color: .green)
            SliderView(sliderValue: $blue, color: .blue)
          }
          .frame(height: 150)
          .focused($focusedField)
          .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
              Spacer()
              Button("Done") {
                focusedField = false
              }
            }
          }
          Spacer()
        }
        .padding()
      }
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      ContentView()
    }
  }
}
