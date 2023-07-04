//
//  FavouritesView.swift
//  Xplore
//
//  Created by Reinhardt de Beer on 2023/06/27.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var userVM: UserStateViewModel
    @StateObject private var favoriteCountries = Favorites()
    
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
                
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            HStack {
                AsyncImage(url: URL(string: userVM.userDetails?.profileURL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 70)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: userVM.userDetails?.profileURL != nil ? "person.crop.circle" : "")
                        .font(.system(size: 50))
                        .scaledToFit()
                        .frame(maxHeight: 70)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }
                
                Spacer()
                
                Text(userVM.userDetails?.username ?? "No username found")
                
                Spacer()
                
                Button(){
                    userVM.signOutUser()
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
            
//            ScrollView(){
                VStack(spacing: 35){
                    List {
                        ForEach(favoriteCountries.favorites.indices, id: \.self) { index in
                            let fav = favoriteCountries.favorites[index]
                            
                            if let countryName = fav.name?.common,
                                let region = fav.subregion,
                                let docID = fav.id,
                                let flag = fav.flags?.png
                            {
                                FavoritesCard(
                                    Country: .constant(countryName),
                                    SmallInfo: .constant(region),
                                    ContextualType: .constant("Test \(index)"),
                                    CountryImage: .constant(flag),
                                    CountryId: .constant(docID)
                                )
                            }
                        }
                        .onDelete { indices in
                            for index in indices {
                                let fav = favoriteCountries.favorites[index]
                                if let docID = fav.id {
                                    favoriteCountries.removeFromFavorites(uid: docID)
                                }
                            }
                        }
                    .listStyle(PlainListStyle())
                }
                .onAppear() {
                    self.favoriteCountries.fetchData()
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
//            }
            
            Spacer()
        }
        }
    }
}

//struct FavouritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritesView()
//    }
//}
