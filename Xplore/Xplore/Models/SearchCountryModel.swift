//
//  SearchCountryModel.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/29.
//

import Foundation

//class SearchCountryViewModel: ObservableObject {
//    @Published var countryData = countryViewModel()
//    
//    @Published var countries = [Country]()
//    
//    @Published var searchTerm: String = ""
//    
//    init() {
//        {|>Publishers.CombineLatest($countryData, $searchTerm)
//                .map { countries, searchTerm in
//                    countries.filter { country in
//                        searchTerm.isEmpty ? true : (country.name.common.matches(searchTerm))
//                    }
//                }
//                .assign(to: &$countries)
//        }
//    }
//}
