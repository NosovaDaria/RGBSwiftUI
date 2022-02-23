//
//  TextFieldView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 21.02.2022.
//

import SwiftUI

struct TextFieldView: View {
  @Binding var sliderValue: Double
  @Binding var textFieldValue: String
  
  @State private var alertPresent = false
  
  
    var body: some View {
      TextField("", text: $textFieldValue) { _ in
        withAnimation {
          checkValue()
        }
      }
        .keyboardType(.decimalPad)
        .frame(width: 45)
        .textFieldStyle(.roundedBorder)
        .alert("Wrong Format", isPresented: $alertPresent, actions: {}) {
          Text("Enter number less or equal 255")
        }
    }
}

extension TextFieldView {
  private func checkValue() {
    if let value = Int(textFieldValue), (0...255).contains(value) {
      self.sliderValue = Double(value)
      return
    }
    alertPresent.toggle()
    sliderValue = 0
    textFieldValue = "0"
  }
}

struct TextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.gray
      TextFieldView(sliderValue: .constant(128.0), textFieldValue: .constant("128"))
    }
  }
}
