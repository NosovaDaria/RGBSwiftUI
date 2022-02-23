//
//  SliderView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 21.02.2022.
//

import SwiftUI

struct SliderView: View {
  
  @Binding var sliderValue: Double
  @State private var textFieldValue = ""
  
  let color: Color
  
    var body: some View {
      HStack {
        ColorValueTextView(value: sliderValue)
        
        Slider(value: $sliderValue, in: 0...255, step: 1)
          .tint(color)
          .onChange(of: sliderValue) { isOnFocus in
            textFieldValue = "\(lround(isOnFocus))"
        }
        TextFieldView(sliderValue: $sliderValue, textFieldValue: $textFieldValue)
      }
      .onAppear {
        textFieldValue = "\(lround(sliderValue))"
      }
    }
}

struct SliderView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray
      SliderView(sliderValue: .constant(100), color: .red)
    }
  }
}

