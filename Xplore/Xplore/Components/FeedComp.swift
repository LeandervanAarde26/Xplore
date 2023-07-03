//
//  FeedComp.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FeedComp: View {
    @Binding var ContextualType: String
    @Binding var Desc: String
    @Binding var Username: String
    @Binding var UserImage: String
    @Binding var CountryName: String
    @Binding var CountryImage: String
    var body: some View {
        VStack(){
            HStack(spacing: 10){
                
                Image("SAFLAG")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 45)
                    .clipShape(Circle())
                
                Text(Username)
                    .font(.headline)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            
//            AsyncImage(url: URL(string: randomCountry.flags?.png ?? "SAFLAG")) { image in
//                image
//                    .resizable()
//                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
//                    .frame(minWidth: 0, maxWidth: 270, minHeight: 0, maxHeight: 200)
            
            AsyncImage(url: URL(string: CountryImage )) { image in
                image
                    .resizable()
                    .frame(width: .infinity, height: 240)
                    .scaledToFit()
            } placeholder: {
                //nil
            }
            
            Text(Desc)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .padding()
            
            Divider()
            
            Text(CountryName)
                .padding(.bottom, 35)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.gray)
                .font(.footnote)
        }
    }
}

//struct FeedComp_Previews: PreviewProvider {
////    static var previews: some View {
////        FeedComp(ContextualType: .constant(""), Desc: .constant("Description"), Username: .constant("Username"), UserImage: .constant(""), CountryName: .constant("Country Name", ))
////    }
//}
