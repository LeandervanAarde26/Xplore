//
//  CountryDetailView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/27.
//

import SwiftUI

struct CountryDetailView: View {
    var body: some View {
        ZStack() {
            VStack() {
                HStack() {
                    Image("purple-pin")
                    
                    Text("Countries").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                }
                
                VStack() {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .imageScale(.large)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding(20)
        }
        .navigationBarTitle(Text("Detail View"), displayMode: .inline)
                .edgesIgnoringSafeArea(.bottom)
                // Hide the system back button
                .navigationBarBackButtonHidden(true)
                // Add your custom back button here

    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView()
    }
}
