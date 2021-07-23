//
//  DeleteColour.swift
//  Colour Search
//
//  Created by Satoshi on 2021-07-21.
//

import SwiftUI

struct DeleteColour: View {
    var rValue: Int
    var gValue: Int
    var bValue: Int
    
    func judgeColorNumber (_ r:Int,_ g:Int,_ b:Int) -> Double {
        
        return Double(r)*0.299+Double(g)*0.587+Double(b)*0.114
    }
    
    func radixJudge (_ n:Int) -> String {
        if n <= 15 {
            return "0"+String(n,radix: 16)
        } else {
            return String(n,radix: 16)
        }
    }
    
    var body: some View {
        VStack {
            ZStack{
                RGBDisplay(R: rValue, G: gValue, B: bValue)
                if judgeColorNumber(rValue, gValue, bValue) < 186{
                    Text(radixJudge(rValue)+(radixJudge( gValue))+(radixJudge(bValue)))
                        .foregroundColor(Color.white)
                }
                else {
                    Text(radixJudge(rValue)+(radixJudge( gValue))+(radixJudge(bValue)))
                        .foregroundColor(Color.black)
                }
            }
            DeleteButton(R: rValue, G: gValue, B: bValue)
        }
    }
}

struct DeleteColour_Previews: PreviewProvider {
    static var previews: some View {
        DeleteColour(rValue: 0, gValue: 155, bValue: 0)
    }
}
