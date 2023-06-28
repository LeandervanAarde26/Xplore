//
//  AddPostView.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct AddPostView: View {
    var plaecholderCountries = ["South Africa", "France", "Italy", "United States"]
    @State var selectedCountry = "South Afica"
    var body: some View {
        
        VStack{
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, alignment: .center)
                    .padding(15)
            
            Spacer().frame(minHeight: 10, maxHeight: 15)
            PhotoPicker()
            Spacer().frame(height: 40)
            VStack{
                      TextField("Description", text: .constant(""))
                          .padding( .vertical, 12)
                          .padding(.horizontal, 10)
                          .lineLimit(3)
                          .background(Color(.systemGray6)
                              .clipShape(RoundedRectangle(cornerRadius:12)))
                      Picker("Country: ", selection: $selectedCountry) {
                          ForEach(plaecholderCountries, id: \.self) { Country in
                              Text(Country.capitalized)
                          }
                      }
                      .frame(minHeight: 0, maxHeight: 110)
                      .pickerStyle(.wheel)
            }
            .padding(.horizontal, 20)
                
            Spacer()
        }
        
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
