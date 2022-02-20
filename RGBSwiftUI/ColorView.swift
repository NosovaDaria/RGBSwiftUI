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
          .padding(.all, 20)

          
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
      ColorView(color: .red)
    }
}
