//
//  MainNavigation.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/26.
//

import SwiftUI
import Firebase

struct MainNavigation: View {
    @State private var loggedIn = false
    

    var body: some View {
//        if ( Auth.auth().currentUser?.uid != nil ) {
            TabView{
                ContentView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                .onAppear() {
                    
                }
                
    //            Text("Countries")
                AddPostView()
                    .tabItem{
                    Label("New Post", systemImage: "plus.circle.fill")
                }
                
    //            CountryDetailView()
                FavouritesView()
                .tabItem{
                    Label("Favorites", systemImage: "heart")
                }
                
                FeedView()
                .tabItem{
                    Label("Feed", systemImage: "note.text")
                }
            }
//        } else {
//            LoginView()
//        }
    }
}

struct MainNavigation_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigation()
          
    }
}
