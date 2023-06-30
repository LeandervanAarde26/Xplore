//
//  CountryDetailView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/27.
//

import SwiftUI

struct CountryDetailView: View {
    @Binding var countryData: Country
    
    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: URL(string: countryData.flags?.png ?? "SAFLAG")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 10)
                } placeholder: {
                    // Placeholder image or view
                }
                
                ScrollView {
                    VStack {
                        HeaderView(countryData: countryData)
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: "Capital", value: countryData.capital?.joined(separator: ", ") ?? "N/A")
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: "Population", value: "\(countryData.population ?? 0)")
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        CurrencyView(currencies: countryData.currencies)
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: "Timezone", value: countryData.timezones?.joined(separator: ", ") ?? "N/A")
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: "Continent", value: countryData.continents?.joined(separator: ", ") ?? "N/A")
                    }
                    .padding()
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding([.top], 5)
            .navigationBarBackButtonHidden()
        }
    }
}

struct HeaderView: View {
    var countryData: Country
    
    var body: some View {
        HStack {
            Image("purple-pin")
            
            Text(countryData.name?.common ?? "")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                .frame(maxWidth: .infinity)
            
            Image(systemName: "heart")
                .foregroundColor(.red)
                .imageScale(.large)
        }
        .padding()
    }
}

struct KeyValueView: View {
    var key: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(key)
                .font(.title2)
            Text(value)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CurrencyView: View {
    var currencies: Currency?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Currency")
                .font(.title2)
            
            Group {
                Text(currencies?.name ?? "N/A")
                    .font(.body)
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
