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
    
    var body: some View {
        VStack(){
            Text(searchTerm)
            List(countryData.countries) { country in
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
                        Image("SAFLAG")
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                minWidth: 0,
                                maxWidth: 40,
                                minHeight: 0,
                                maxHeight: 70
                            )
                            .frame(width: 40, height: 40)
                    }.frame(width: 40, height: 40)
                    
                    Spacer()
                    Text(country.name?.common ?? "Country Name")
                    Spacer()
                }
            }
            .listStyle(PlainListStyle()) // Optional:
            .background(Color.clear)
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
