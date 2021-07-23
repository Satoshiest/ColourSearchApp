//
//  RGBDisplay.swift
//  Colour Search
//
//  Created by Satoshi on 2021-07-20.
//

import SwiftUI

struct RGBDisplay: View {
    var R:Int
    var G:Int
    var B:Int
    var body: some View {
     //   GeometryReader { geometry in
        Rectangle()
            .frame(width: 300, height: 250)
            .foregroundColor(Color.init(UIColor(self.R,self.G,self.B)))
            .cornerRadius(50)
            .shadow(color: Color.gray.opacity(0.7), radius: 10.0, x: 0.0, y: 0.0)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RGBDisplay(R: 0, G: 0, B: 0)
    }
}
