//
//  ColorValueTextView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 23.02.2022.
//

import SwiftUI

struct ColorValueTextView: View {
  
  let value: Double
  
    var body: some View {
      Text("\(lround(value))")
        .frame(width: 40)
        .foregroundColor(.white)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color.gray
        ColorValueTextView(value: 128)
      }
    }
}
