//
//  FavouritesView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var userVM: UserStateViewModel
    
    func signOut() async {
        await userVM.signOutUser()
    }
    
    var body: some View {
        VStack(){
            HStack(alignment: VerticalAlignment.center){
                
                Spacer()
                
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 35, alignment: .center)
                
                Spacer()
                
                Image("light-blue-pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                
                Text("Favourites")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0, green: 0.19, blue: 0.53))
                    .padding(.top, 5)
                
                Spacer()
                
            }.padding(.top, 10)
                .padding(.bottom, 20)
            
            HStack {
                Image("SAFLAG")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                //Text
                Text("Username")
                
                Spacer()
                //Button
                Button(){
                    // Add Task
                    Task {
                        await signOut()
                    }
                } label: {
                    Text("Logout")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 5)
                        .background(Color(.red))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
                }
            }
            .padding(10)
            
            ScrollView(){
                VStack(spacing: 35){
                    ForEach(0..<10) {
                        Divider()
                        FavoritesCard(Country: .constant("Country Name"),
                                      SmallInfo: .constant("Smallinfo"),
                                      ContextualType: .constant("Test \($0)"))
                    }
                    
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
            
            Spacer()
            
        }
        .onAppear() {
            userVM.getUserDetails(userId: userVM.getUserId())
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
