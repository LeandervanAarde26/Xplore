//
//  SearchDropdown.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/27.
//

import SwiftUI

struct SearchDropdown: View {
    @Binding var searchTerm: String
    @Binding var Data: [Country]
    
    var filteredCountries: [Country] {
        
            guard !searchTerm.isEmpty else {
                return Data
            }

            let lowercasedQuery = searchTerm.lowercased()

            return Data.filter { singleCountry in
                singleCountry.name?.common?.lowercased().contains(lowercasedQuery) ?? false
            }
        }

    
    var body: some View {
        VStack{
            List(filteredCountries) { country in
                NavigationLink(
                    /// 1
                    destination: CountryDetailView(countryData: .constant(country)),
                    /// 2
                    label: {
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

                                }.frame(width: 40, height: 40)
                                
                                Spacer()
                                
                                Text(country.name?.common ?? "Country Name")
                                
                                Spacer()
                            }
                    }
                )
            }.listStyle(PlainListStyle()) // Optional:
            .background(Color.clear)
        }
    }
}

//struct SearchDropdown_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchDropdown(searchTerm: .constant(""), Data: [Country])
//    }
//}
