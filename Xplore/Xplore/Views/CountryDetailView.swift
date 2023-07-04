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
                        
                        KeyValueView(key: .constant("Capital"), value: .constant(countryData.capital?.joined(separator: ", ") ?? "N/A"))
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: .constant("Population"), value: .constant("\(countryData.population ?? 0)"))
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        CurrencyView(currencies: countryData.currencies)
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
                        KeyValueView(key: .constant("Timezone"), value: .constant(countryData.timezones?.joined(separator: ", ") ?? "N/A"))
                        
                        Divider()
                            .frame(height: 0.5)
                            .background(Color("AppGray"))
                        
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
    
    @ObservedObject private var favouritesViewModel = FavouritesViewModel()
    @ObservedObject private var userState = UserStateViewModel()
    
    @State var favourited = false
    
    var userId = UserStateViewModel().getUserId()
    
    var body: some View {
        HStack {
            Image("purple-pin")
            
            Text(countryData.name?.common ?? "")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                .frame(maxWidth: .infinity)
            
            Button(){
                print(countryData.favourited?.contains(userId) ??  false)
                
                if favourited {
                    favouritesViewModel.delFavouriteCountry(uid: userId, countryId: countryData.id ?? "none")
                    favourited = !favourited
                } else {
                    favouritesViewModel.FavouriteCountry(uid: userId, countryId: countryData.id ?? "none")
                    favourited = !favourited
                }
                
            } label: {
                Image(systemName: favourited ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .imageScale(.large)
            }
            .padding()
            .onAppear {
                if favouritesViewModel.checkIfFavourited(uid: userId, countryId: countryData.id ?? "none", countryData: countryData) {
                    favourited = true
                } else {
                    favourited = false
                }
            }
        }
    }
}

struct KeyValueView: View {
    @Binding var key: String
    @Binding var value: String
    
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
            
            HStack {
                Text(currencies?.name ?? "N/A")
                    .font(.body).frame(maxWidth: .infinity, alignment: .center)
                Text(currencies?.symbol ?? "N/A")
                    .font(.body).frame(maxWidth: .infinity, alignment: .center)
                Text(currencies?.acronym ?? "N/A")
                    .font(.body).frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
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
