//
//  CountryDetailView.swift
//  Xplore
//
//  Created by Vian du Plessis on 2023/06/27.
//

import SwiftUI

struct CountryDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack( spacing: 25 ) {
                    Image("purple-pin")
                    
                    Text("Columbia").font(.system(size: 28, weight: .bold)).foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                }
                .padding([.bottom], 30)
                
                VStack() {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .imageScale(.large)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding([.bottom], 5)
                        
                    
                    Image("SAFLAG")
                        .resizable()
                        .scaledToFit()
                }
                .padding([.leading, .trailing], 60)
                
                VStack() {
                    VStack(alignment: .leading) {
                        Text("Label")
                            .font(.system(size: 20))
                        
                        Text("Description")
                            .font(.system(size: 15))
                    }
    //                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    
                    Divider()
                        .frame(height: 0.5)
                     .background(Color("AppGray"))
                    
                    VStack(alignment: .leading) {
                        Text("Label 2")
                            .font(.system(size: 20))
                        
                        Text("Description")
                            .font(.system(size: 15))
                    }
    //                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    
                    Divider()
                        .frame(height: 0.5)
                     .background(Color("AppGray"))
                    
                    VStack(alignment: .leading) {
                        Text("Label 3")
                            .font(.system(size: 20))
                        
                        Text("Description")
                            .font(.system(size: 15))
                    }
    
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding([.leading, .trailing], 35)
                .padding([.top], 40)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding([.top], 40)
//            .navigationBarTitle(appLogo, displayMode: .inline)
            .navigationBarItems(leading: backButton, trailing: appLogo)
            .navigationBarBackButtonHidden()
        }
    }
    
    var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
        }
    }
    
    var appLogo: some View {
        HStack() {
            Spacer()
            Image("Icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            Spacer()
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView()
    }
}
