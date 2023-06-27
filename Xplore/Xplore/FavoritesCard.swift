//
//  FavoritesCard.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct FavoritesCard: View {
    var body: some View {
        HStack{
            Image("SAFLAG")
                .resizable()
                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                .frame(
                    minWidth: 0,
                    maxWidth: 80,
                    minHeight: 0,
                    maxHeight: 70
                    )
            Spacer()
            VStack(alignment: .leading){
                Text("Hello world")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                Text("Some small info")
                    .font(.system(size: 12, weight: .light, design: .monospaced))
            }
            Spacer()
            Spacer()
            Image(systemName: "x.circle")
                .foregroundColor(.red)
                .frame(width: 30,height: 30)
        }
        
        .background(Color.white)
        .padding(.horizontal, 10)
        
        .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: 90)
        
     
    }
 
}

struct FavoritesCard_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesCard()
    }
}
