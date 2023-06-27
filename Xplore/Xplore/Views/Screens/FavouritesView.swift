//
//  FavouritesView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FavouritesView: View {
    var body: some View {
        VStack(){
            Image("Icon").resizable().scaledToFit().frame(width: 100, alignment: .center).padding(20)
            HStack(spacing: 60){
                Image("light-blue-pin").resizable().scaledToFit().frame(width: 25)
                Text("Favourites").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
            }.padding(.bottom, 40)
            ScrollView(){
                VStack(){
                    //favourite items
                    ForEach(0..<100) {
                        Text("Test <3 \($0)")
                    }
                    
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
            Spacer()
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
