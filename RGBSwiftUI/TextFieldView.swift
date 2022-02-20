//
//  TextFieldView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 21.02.2022.
//

import SwiftUI

struct TextFieldView: View {
  @Binding var sliderValue: Double
  @Binding var alertPresent: Bool
  @Binding var textFieldValue: String
  
    var body: some View {
      TextField("", text: $textFieldValue)
        .onChange(of: textFieldValue, perform: { newValue in
          if var newValue = Double("0\(newValue)") {
            if (newValue > 255) {
              alertPresent.toggle()
              newValue = 255
            }
            sliderValue = Double(newValue)
          } else {
            alertPresent.toggle()
          }
          
          textFieldValue = String(lround(sliderValue))
        })
      
        .keyboardType(.numberPad)
        .textFieldStyle(.roundedBorder)
      
        .alert("Wrong Format", isPresented: $alertPresent, actions: {}) {
          Text("Enter number less or equal 255")
        }
    }
}
