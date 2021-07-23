//
//  SavedColours.swift
//  Colour Search
//
//  Created by Satoshi on 2021-07-21.
//

import SwiftUI

struct SavedColours: View {
    @EnvironmentObject var favoriteArray: ObservedRGB
    private func reversedFavoriteArray (arr: [[Int]]) -> [[Int]] {
        
        return arr.reversed()
    }
    
    var body: some View {
        
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Spacer()
                VStack(spacing: 10){
                    
                    ForEach(0..<self.favoriteArray.rgbArray.count, id: \.self) { item in
                        ZStack {
                            ColourBar(rValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][0], gValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][1], bValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][2])
                            NavigationLink(destination: DeleteColour(rValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][0], gValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][1], bValue: self.reversedFavoriteArray(arr: self.favoriteArray.rgbArray)[item][2])) {
                                Text("                                                                  ")
                            }
                        }
                    }
                }
            }.navigationBarTitle("Saved Colours", displayMode: .inline)
        }.onAppear {
            guard let defaultItem = UserDefaults.standard.array(forKey: "storedArray") as? [[Int]]
            else {
                return }
            self.favoriteArray.rgbArray = defaultItem
        }
    }
}


struct SavedColours_Previews: PreviewProvider {
    static let favoriteArray = ObservedRGB()
    static var previews: some View {
        SavedColours().environmentObject(favoriteArray)
    }
}
