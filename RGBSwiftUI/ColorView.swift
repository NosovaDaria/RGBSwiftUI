//
//  ColorView.swift
//  RGBSwiftUI
//
//  Created by Дарья Носова on 20.02.2022.
//

import SwiftUI

struct ColorView: View {
  
  let color: Color
  
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
          .foregroundColor(color)
          .frame(width: 350, height: 180)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .stroke(lineWidth: 2)
              .foregroundColor(.gray)
          )
          .padding(.all, 20)
          .shadow(color: Color.gray, radius: 3, x: 1, y: 2)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
      ColorView(color: .red)
    }
}
