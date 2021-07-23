//
//  SaveButton.swift
//  Colour Search
//
//  Created by Satoshi on 2021-07-21.
//

import SwiftUI

struct SaveButton: View {
    var R: Int
    var G: Int
    var B: Int
    @EnvironmentObject var favoriteArray: ObservedRGB
    var body: some View {
        //    GeometryReader { geometry in
        Button(action: {
            print("tapped")
            
            if !(self.favoriteArray.rgbArray.contains([self.R,self.G,self.B])) {
                self.favoriteArray.rgbArray.append([self.R,self.G,self.B])
                UserDefaults.standard.set(self.favoriteArray.rgbArray, forKey: "storedArray")
            }
            
        }) {
            Text("Save")
                .frame(width: 300, height: 50)
                .background(Color.init(UIColor(226,233,243)))
                
                .border(Color.gray, width: 2)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.7), radius: 10.0, x: 0.0, y: 0.0)
            // }
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(R: 0, G: 0, B: 0)
    }
}
