//
//  SearchDropdown.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct SearchDropdown: View {
    @ObservedObject private var countryData = countryViewModel()
    
    @Binding var searchTerm: String
    
    var filteredCountries: [Country] {
            guard !searchTerm.isEmpty else {
                return countryData.countries
            }

            let lowercasedQuery = searchTerm.lowercased()

            return countryData.countries.filter { singleCountry in
                singleCountry.name?.common?.lowercased().contains(lowercasedQuery) ?? false
            }
        }

    
    var body: some View {
        VStack(){
            List(filteredCountries) { country in
                HStack {
                    AsyncImage(url: URL(string: country.flags?.png ?? "SAFLAG")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                minWidth: 0,
                                maxWidth: 40,
                                minHeight: 0,
                                maxHeight: 70
                            )
                            .frame(width: 40, height: 40) // Adjust the width and height of the image as needed/
                    } placeholder: {
//                        Image("SAFLAG")
//                            .aspectRatio(contentMode: .fit)
//                            .frame(
//                                minWidth: 0,
//                                maxWidth: 40,
//                                minHeight: 0,
//                                maxHeight: 70
//                            )
//                            .frame(width: 40, height: 40)
                    }.frame(width: 40, height: 40)
                    
                    Spacer()
                    
                    Text(country.name?.common ?? "Country Name")
                    
                    Spacer()
                }
            }
            .listStyle(PlainListStyle()) // Optional:
            .background(Color.clear)
            .searchable(text: $searchTerm)
        }
        .background(Color.clear)
        .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 20,
        maxHeight: 500)
        .onAppear(){
            self.countryData.fetchData()
        }
    }
}

struct SearchDropdown_Previews: PreviewProvider {
    static var previews: some View {
        SearchDropdown(searchTerm: .constant(""))
    }
}
