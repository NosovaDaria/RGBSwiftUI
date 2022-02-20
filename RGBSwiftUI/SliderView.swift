//
//  SliderView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 21.02.2022.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: Double
  @Binding var textFieldValue: String
  let color: Color
  
    var body: some View {
      Slider(value: $sliderValue, in: 0...255, step: 1)
        .accentColor(color).frame(width: 240, height: 2)
        .onChange(of: sliderValue) { newValue in
          textFieldValue = String(lround(newValue))
        }
    }
}
