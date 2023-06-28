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
            HStack(alignment: .center){
                Spacer()
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35)
                
                Spacer()
                
                Image("dark-blue-pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                
                Text("New Post")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53)).padding(.top, 5)
                
                Spacer()
            }.padding(.vertical)
        
            Divider()
//            Spacer()
            Spacer()
            PhotoPicker()
            Spacer().frame(height: 40)
            VStack{
                      TextField("Description", text: .constant(""))
                          .padding( .vertical, 12)
                          .padding(.horizontal, 10)
                          .frame(minHeight: 100)
                          .lineLimit(3)
                          .background(Color(.systemGray6)
                              .clipShape(RoundedRectangle(cornerRadius:12)))
                      Picker("Country: ", selection: $selectedCountry) {
                          ForEach(plaecholderCountries, id: \.self) { Country in
                              Text(Country.capitalized)
                          }
                      }
                      .frame(minHeight: 0, maxHeight: 115)
                      .pickerStyle(.wheel)
            }
            .padding(.horizontal, 20)
            HStack{
                
                Button(action: {print("Button pressed")}){
                    Text("Clear post")
                }
                .buttonStyle(.borderless)
                .frame(
                    maxWidth: .infinity)
                .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
                
                Button(action: {print("Button pressed")}){
                    Text("Add post")
                }
                .buttonStyle(.borderedProminent)
                .frame(maxWidth: .infinity)
                .tint(Color(red: 0.48, green: 0.53, blue: 0.95))
            }
                
            Spacer()
        }
        
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
