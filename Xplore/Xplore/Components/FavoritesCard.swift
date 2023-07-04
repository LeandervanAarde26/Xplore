//
//  FavoritesCard.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct FavoritesCard: View {
    @Binding var Country: String
    @Binding var SmallInfo: String
    @Binding var ContextualType: String
    @Binding var CountryImage: String
    @Binding var CountryId: String
    var body: some View {
        Divider()
        HStack{
            
            AsyncImage(url: URL(string: CountryImage )) { image in
                image
                    .resizable()
                    .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                    .frame(
                        minWidth: 0,
                        maxWidth: 80,
                        minHeight: 0,
                        maxHeight: 70
                    )
            } placeholder: {
                //nil
            }
            Spacer()
            VStack(alignment: .leading){
                Text(Country)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                Text(SmallInfo)
                    .font(.system(size: 12, weight: .light, design: .monospaced))
            }
            Spacer()
            Spacer()
            Image(systemName: "x.circle")
                .foregroundColor(.red)
                .frame(width: 50,height: 50)
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

//struct FavoritesCard_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesCard(Country: .constant("Country name"), SmallInfo: .constant("Small info"), ContextualType: .constant("Country name"))
//    }
//}
