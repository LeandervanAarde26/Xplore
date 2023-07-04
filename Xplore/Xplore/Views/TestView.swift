//
//  TestView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/28.
//

import SwiftUI

struct TestView: View {
    @ObservedObject private var countryData = countryViewModel()
    var body: some View {
        VStack() {
            List(countryData.countries) { country in
                Text(country.name?.common ?? "No Name")
            }
        }
        .onAppear(){
            self.countryData.fetchData()
            print(self.countryData.fetchData())
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
