//
//  FeedView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(){
            HStack(alignment: VerticalAlignment.center){
                Spacer()
                Image("Icon").resizable().scaledToFit().frame(height: 35, alignment: .center)
                Spacer()
                Image("yellow-pin").resizable().scaledToFit().frame(width: 20).padding(.trailing, 20).padding(.top, 5)
                Text("Feed").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53)).padding(.top, 5)
                Spacer()
            }.padding(.top, 10).padding(.bottom, 20)
            ScrollView(){
                ForEach(0..<10) {
                    FeedComp(ContextualType: .constant("Test \($0)"), Desc: .constant("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard."), Username: .constant("User Name"), UserImage: .constant(""), CountryName: .constant("Country name"))
                }
            }
            Spacer()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
