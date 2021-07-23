//
//  Main.swift
//  Colour Search
//
//  Created by Satoshi on 2021-07-21.
//

import SwiftUI

struct Main: View {
    @State private var selection = 0
    static let favoriteArray = ObservedRGB()
    var body: some View {
        
        TabView(selection: $selection) {
            ColourSlider(R: 0, G: 0, B: 0).environmentObject(Main.favoriteArray).tabItem({Image(systemName: "slider.horizontal.3")}).tag(0)
            
            SavedColours().environmentObject(Main.favoriteArray)
                .tabItem{Image(systemName: "paperclip")}.tag(1)
            
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
