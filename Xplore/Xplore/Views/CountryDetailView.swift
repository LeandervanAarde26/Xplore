//
//  CountryDetailView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/27.
//

import SwiftUI

struct CountryDetailView: View {
        
    @Binding var countryData: Country
    var tempArrray = ["hey"]

        
    var body: some View {
        NavigationView {
            VStack() {
            AsyncImage(url: URL(string: countryData.flags?.png ?? "SAFLAG")) { image in
                image.resizable()
                    .scaledToFit()
                    .shadow(radius: 10)// Adjust the width and height of the image as needed/
            } placeholder: {

            }
                
                ScrollView{
                    HStack() {
                        Image("purple-pin")
                        
                        Text(countryData.name?.common ?? "").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                            .frame(maxWidth: .infinity)
                        
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Capital")
                        .font(.title2)
                        ForEach(countryData.capital ?? ["Ljubljana"], id:\.self) {
                            capital in
                            Text(capital)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        
                    Divider()
                    .frame(height: 0.5)
                    .background(Color("AppGray"))
                
                    VStack(alignment: .leading) {
                        Text("Population")
                            .font(.title2)
                        
                        Text(String(countryData.population ?? 0))
                            .font(.system(size: 15))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Divider()
                        .frame(height: 0.5)
                     .background(Color("AppGray"))
                        
                    VStack(alignment: .leading) {
                        Text("Currency")
                            .font(.title2)
                            Text(countryData.currencies?.name ?? "")
                                .font(.body).frame(maxWidth: .infinity)
                        HStack{
                            Text(countryData.currencies?.symbol ?? "")
                                .font(.body).frame(maxWidth: .infinity)
                            Text(countryData.currencies?.acronym ?? "")
                                .font(.body).frame(maxWidth: .infinity)
                        }
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                        .frame(height: 0.5)
                     .background(Color("AppGray"))
                    
                    VStack(alignment: .leading) {
                        Text("Timezone")
                        .font(.title2)
                        ForEach(countryData.timezones ?? ["Ljubljana"], id:\.self) {
                            capital in
                            Text(capital)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Divider()
                        .frame(height: 0.5)
                     .background(Color("AppGray"))
                    
                    VStack(alignment: .leading) {
                        Text("Continent")
                        .font(.title2)
                        ForEach(countryData.continents ?? ["Ljubljana"], id:\.self) {
                            capital in
                            Text(capital)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)

                }.padding()
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .padding([.top], 5)
            .navigationBarBackButtonHidden()
            
            }.onAppear() {
            print(countryData.continents ?? "")
        }
    }
}
//
//struct CountryDetailView_Previews: PreviewProvider {
//    @Binding var countryData: Country
//    static var previews: some View {
//
//        CountryDetailView(data: .constant(countryData))
//    }
//}
